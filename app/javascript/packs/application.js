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
import draggable from 'vuedraggable'

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
    var element2 = document.querySelector("#mode1")
    if (element2 != undefined) {
        const app = new Vue({
            el: element2,
            data(){return{
                    tests: [{name:'big'}],
                    availableItemOptions:{
                        group: {
                            name: "lists",
                            pull: "clone",
                            put: false
                            },
                        sort: false
                    }}},
            created: function() {
                console.log(data)
            },
            template: "<draggable v-model='tests' :options='availableItemOptions'><div v-for='test in tests'>{{test.name}}</div></draggable>",
            components: { draggable },
        })
    }
});