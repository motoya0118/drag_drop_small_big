// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import {initKanbanSortable} from '../plugins/initSortable'
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require('jquery')

Rails.start()
Turbolinks.start()
ActiveStorage.start()
$(function() {
  $('.nav-item').on('click', function() {
    //イベントが発生した時に行う処理
    if($(this).text() == 'モード1'){
      // $( ".kanban" ).sortable( "destroy" );
      // $( "#kanban-big" ).sortable( "destroy" );
      // $( ".kanban-small" ).sortable( "destroy" );
      const kanban = document.querySelectorAll(".kanban");  
      if (kanban) {
        initKanbanSortable(kanban,'.kanban-big-name');
      };
    } else if($(this).text() == 'モード2'){
      const kanban = document.querySelectorAll("#kanban-big");
      if (kanban) {
        initKanbanSortable(kanban,'.kanban-small-name');
      };
    } else {
      const kanban = document.querySelectorAll(".kanban-small");
      if (kanban) {
        initKanbanSortable(kanban,'.kanban-col-item');
      };
    }
  });
});