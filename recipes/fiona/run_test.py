import os
import fiona

fname = os.path.join(os.environ['RECIPE_DIR'], 'test_data', 'test.shp')

with fiona.open(fname, 'r') as f:
    assert f.schema['geometry'] == 'Point'
