import numpy
import pytest

import snuggs

# Fixtures follow the tests. See the end of the file.


def test_integer():
    assert list(snuggs.integer.parseString('1')) == [1]


def test_real():
    assert list(snuggs.real.parseString('1.1')) == [1.1]


def test_int_expr():
    assert snuggs.eval('(+ 1 2)') == 3


def test_real_expr():
    assert round(snuggs.eval('(* 0.1 0.2)'), 3) == 0.02


def test_int_real_expr():
    assert snuggs.eval('(+ 2 1.1)') == 3.1


def test_real_int_expr():
    assert snuggs.eval('(+ 1.1 2)') == 3.1


def test_arr_var(ones):
    r = snuggs.eval('(+ foo 0)', foo=ones)
    assert list(r.flatten()) == [1, 1, 1, 1]


def test_arr_lookup(ones):
    r = snuggs.eval('(read 1)', foo=ones)
    assert list(r.flatten()) == [1, 1, 1, 1]


def test_arr_lookup_2(ones):
    r = snuggs.eval('(read 1 1)', foo=ones)
    assert list(r.flatten()) == [1, 1]


def test_arr_take(ones):
    r = snuggs.eval('(take foo 1)', foo=ones)
    assert list(r.flatten()) == [1, 1]
    r = snuggs.eval('(take foo 2)', foo=ones)
    assert list(r.flatten()) == [1, 1]


def test_int_arr_expr(ones):
    result = snuggs.eval('(+ foo 1)', foo=ones)
    assert list(result.flatten()) == [2, 2, 2, 2]


def test_int_arr_expr_by_name(ones):
    result = snuggs.eval('(+ (read 1) 1.5)', foo=ones)
    assert list(result.flatten()) == [2.5, 2.5, 2.5, 2.5]


def test_int_arr_read(ones):
    result = snuggs.eval('(+ (read 1 1) 1.5)', foo=ones)
    assert list(result.flatten()) == [2.5, 2.5]


def test_list(ones):
    result = snuggs.eval(
        '(asarray (take foo 1) (take foo 1) (take bar 1) (take bar 1))',
        foo=ones, bar=ones)
    assert list(result.flatten()) == [1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0]


def test_eq(ones):
    ones[0][0] = 2
    result = snuggs.eval('(== foo 1)', foo=ones)
    assert list(result.flatten()) == [False, True, True, True]


def test_or(truetrue, truefalse):
    result = snuggs.eval(
        '(| foo bar)', foo=truetrue, bar=truefalse)
    assert list(result.flatten()) == [True, True]


def test_and(truetrue, truefalse):
    result = snuggs.eval(
        '(& foo bar)', foo=truetrue, bar=truefalse)
    assert list(result.flatten()) == [True, False]


def test_ones_like(truefalse):
    result = snuggs.eval("(ones_like foo 'uint8')", foo=truefalse)
    assert list(result.flatten()) == [1.0, 1.0]


def test_full_like(truefalse):
    result = snuggs.eval("(full_like foo 3.14 'float64')", foo=truefalse)
    assert list(result.flatten()) == [3.14, 3.14]
    result = snuggs.eval('(full_like foo 3.14 "float64")', foo=truefalse)
    assert list(result.flatten()) == [3.14, 3.14]


def test_ufunc(truetrue, truefalse):
    result = snuggs.eval(
        '(where (& foo bar) 1 0)', foo=truetrue, bar=truefalse)
    assert list(result.flatten()) == [1.0, 0.0]


def test_partial():
    result = snuggs.eval('((partial * 2) 2)')
    assert result == 4


def test_map_func():
    result = snuggs.eval('(map sqrt (asarray 1 4 9))')
    assert list(result) == [1, 2, 3]


def test_map_partial():
    result = snuggs.eval('(map (partial * 2) (asarray 1 2 3))')
    assert list(result) == [2, 4, 6]


def test_map_asarray():
    result = snuggs.eval('(asarray (map (partial * 2) (asarray 1 2 3)))')
    assert list(result) == [2, 4, 6]


def test_nil():
    assert snuggs.eval('(== nil nil)')
    assert not snuggs.eval('(== 1 nil)')
    assert not snuggs.eval('(== nil 1)')
    assert snuggs.eval('(!= 1 nil)')
    assert snuggs.eval('(!= nil 1)')


def test_masked_arr():
    foo = numpy.ma.masked_equal(numpy.array([0, 0, 0, 1], dtype='uint8'), 0)
    r = snuggs.eval('(+ foo 1)', foo=foo)
    assert list(r.data.flatten()) == [0, 0, 0, 2]
    assert list(r.flatten()) == [numpy.ma.masked, numpy.ma.masked, numpy.ma.masked, 2]


# Parse and syntax error testing.
def test_missing_closing_paren():
    with pytest.raises(SyntaxError) as excinfo:
        result = snuggs.eval("(+ 1 2")
    assert excinfo.value.lineno == 1
    assert excinfo.value.offset == 7
    assert str(excinfo.value) == 'Expected ")"'


def test_missing_func():
    with pytest.raises(SyntaxError) as excinfo:
        result = snuggs.eval("(0 1 2)")
    assert excinfo.value.lineno == 1
    assert excinfo.value.offset == 2
    assert str(excinfo.value) == "'0' is not a function or operator"


def test_missing_func2():
    with pytest.raises(SyntaxError) as excinfo:
        result = snuggs.eval("(# 1 2)")
    assert excinfo.value.lineno == 1
    assert excinfo.value.offset == 2
    assert str(excinfo.value) == "expected a function or operator"


def test_undefined_var():
    with pytest.raises(SyntaxError) as excinfo:
        result = snuggs.eval("(+ 1 bogus)")
    assert excinfo.value.lineno == 1
    assert excinfo.value.offset == 6
    assert str(excinfo.value) == "name 'bogus' is not defined"


def test_bogus_higher_order_func():
    with pytest.raises(SyntaxError) as excinfo:
        result = snuggs.eval("((bogus * 2) 2)")
    assert excinfo.value.lineno == 1
    assert excinfo.value.offset == 3
    assert str(excinfo.value) == "expected a function or operator"


def test_type_error():
    with pytest.raises(TypeError) as excinfo:
        result = snuggs.eval("(+ 1 'bogus')")


# Fixtures.
@pytest.fixture
def ones():
    return numpy.ones((2, 2))


@pytest.fixture
def truetrue():
    return numpy.array([True, True])


@pytest.fixture
def truefalse():
    return numpy.array([True, False])
