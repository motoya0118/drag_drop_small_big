import { Draggable } from '@shopify/draggable';
const initKanbanSortable = (canElements,target) => {
  var count = 0;
  canElements.forEach((ul) => {
      new Draggable.default(ul, {
        draggable: 'li'
    });
    count++;
    console.log(Draggable)
  });
};
export { initKanbanSortable };