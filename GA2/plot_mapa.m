% lat, lon 
function [] = plot_mapa(ind)
load '../mapa/BrazilMap';
load '../mapa/cidades';
lat_range = [min(lat), max(lat)];
lon_range = [min(lon), max(lon)];
axesm('mercator','MapLatLimit',lat_range,'MapLonLimit',lon_range,...
'Grid','on','Frame','on','MeridianLabel','on','ParallelLabel','on');
geoshow(lat,lon,'DisplayType','line','color','b');
stopsLat = extractfield(Cities, 'Lat');
stopsLon = extractfield(Cities, 'Lon');
geoshow(stopsLat(ind),stopsLon(ind),'DisplayType','point','color','b');
ind_lat = [];
ind_lon = [];
for i = 1: length(ind)
    index = ind(i);
    ind_lat = [ind_lat, Cities(index).Lat];
    ind_lon = [ind_lon, Cities(index).Lon];
end
[X, Y] = mfwdtran(ind_lat',ind_lon');
arrow([X(1:(end-1)) Y(1:(end-1)); X(end) Y(end)], [X(2:end) Y(2:end); X(1) Y(1)],'Length',5)

end