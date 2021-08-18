import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

// if (navigator.serviceWorker) {
//   navigator.serviceWorker.register('/serviceworker.js', { scope: './' })
//     .then(function(reg) {
//       console.log('[Page] Service worker registered!')
//     })
// }
