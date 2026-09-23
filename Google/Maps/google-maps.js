/* Google Maps loader shim (readable version) */

function initGoogleMapsLoader(config) {
  var apiName = 'The Google Maps JavaScript API';
  var googleNamespace = 'google';
  var importLibraryName = 'importLibrary';
  var callbackName = '__ib__';
  var doc = document;
  var win = window;

  var loadPromise;
  var mapsNamespace;
  var requestedLibraries = new Set();
  var queryParams = new URLSearchParams();

  win = win[googleNamespace] || (win[googleNamespace] = {});
  mapsNamespace = win.maps || (win.maps = {});

  function loadMapsScript() {
    if (!loadPromise) {
      loadPromise = new Promise(function(resolve, reject) {
        var script = doc.createElement('script');
        script.src = 'https://maps.' + googleNamespace + 'apis.com/maps/api/js?' +
          queryParams + '&callback=' + googleNamespace + '.maps.' + callbackName;
        script.async = true;
        script.onerror = function() {
          reject(Error(apiName + ' could not load.'));
        };
        doc.head.appendChild(script);
        mapsNamespace[callbackName] = resolve;
      });
    }
    return loadPromise;
  }

  if (mapsNamespace[importLibraryName]) {
    console.warn(apiName + ' only loads once. Ignoring duplicate loader.');
  } else {
    mapsNamespace[importLibraryName] = function(library) {
      var args = Array.prototype.slice.call(arguments, 1);
      requestedLibraries.add(library);
      return loadMapsScript().then(function() {
        return mapsNamespace[importLibraryName].apply(mapsNamespace, [library].concat(args));
      });
    };
  }

  for (var key in config) {
    if (config.hasOwnProperty(key)) {
      queryParams.set(key, config[key]);
    }
  }
}

initGoogleMapsLoader({
  key: 'AIzaSyCYcj2wHmJjm_CQDpl02mXI2qWBV-5EWoE',
  v: 'weekly',
  map_ids: '7c151be88bb28cf02723aa80'
});