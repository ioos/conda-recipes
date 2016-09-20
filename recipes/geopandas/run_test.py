import os
import geopandas

fname = os.path.join(os.environ['RECIPE_DIR'], 'test_data', 'test.shp')
geopandas.read_file(fname)
