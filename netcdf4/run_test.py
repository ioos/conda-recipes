import netCDF4

url = 'http://test.opendap.org:80/opendap/data/ncml/sample_virtual_dataset.ncml'
nc = netCDF4.Dataset(url)
print(nc.filepath())
