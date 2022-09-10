require("@rails/ujs")
require("turbolinks").start()
require("channels")

window.Rails = Rails
Rails.start();

import Vue from 'vue/dist/vue.esm'
import Vuex from 'vuex'
import App from '../app.vue'
import Rails from '@rails/ujs';
import TurbolinksAdapter from 'vue-turbolinks'

Vue.config.devtools = true;
Vue.use(Vuex)
Vue.use(TurbolinksAdapter)

window.store = {}


document.addEventListener("turbolinks:load", function() {
    var element = document.querySelector("#boards")
    if (element != undefined) {
        window.store.lists = JSON.parse(element.dataset.lists)
        
        const app = new Vue({
            el: element,
            data: window.store,
            template: "<App :original_lists='lists' />",
            components: { App }
        })
    }
});