require("@rails/ujs")
require("turbolinks").start()
require("channels")

window.Rails = Rails
Rails.start();

import Vue from 'vue/dist/vue.esm'
import Vuex from 'vuex'
import App from '../app.vue'
import Insert from '../insert_bigs.vue'
import Smalls from '../insert_smalls.vue'
import Cards from '../insert_cards.vue'
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
        window.store.id = JSON.parse(element.dataset.id)
        
        const app = new Vue({
            el: element,
            data: window.store,
            template: "<App :original_lists='lists' />",
            components: { App }
        })
    }
    var element2 = document.querySelector("#mode1")
    if (element2 != undefined) {
        
        const app = new Vue({
            el: element2,
            template: "<insert></insert>",
            data: window.store,
            components: { Insert }
        })
    }
    var element3 = document.querySelector("#mode2")
    if (element3 != undefined) {
        
        const app = new Vue({
            el: element3,
            template: "<smalls></smalls>",
            data: window.store,
            components: { Smalls }
        })
    }
    var element4 = document.querySelector("#mode3")
    if (element4 != undefined) {
        
        const app = new Vue({
            el: element4,
            template: "<cards></cards>",
            data: window.store,
            components: { Cards }
        })
    }
});