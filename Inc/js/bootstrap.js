import * as bootstrap from 'https://cdn.jsdelivr.net/npm/bootstrap@6.0.0-alpha.1/dist/js/bootstrap.bundle.js'

window.bootstrap = bootstrap
document.dispatchEvent(new Event('bootstrap-ready'))
