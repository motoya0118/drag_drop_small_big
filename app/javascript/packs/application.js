// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import {initKanbanSortable} from '../plugins/initSortable'

Rails.start()
Turbolinks.start()
ActiveStorage.start()
document.addEventListener('turbolinks:load', () => {
  const kanbanBigs = document.querySelectorAll("#kanban-big");
  const kanbanSmalls = document.querySelectorAll(".kanban-small");
  if (kanbanSmalls) {
    initKanbanSortable(kanbanSmalls,'.kanban-col-item');
  };
  if (kanbanBigs) {
    initKanbanSortable(kanbanBigs,'.kanban-small-name');
  };
});
