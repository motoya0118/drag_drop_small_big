import Sortable from 'sortablejs';
const initKanbanSortable = (canElements,target) => {
  var count = 0;
  var sortable = [];
  canElements.forEach((ul) => {
      sortable[count] = new Sortable(ul, {
        group: 'can', // set both lists to same group
        animation: 300,
        handle: target,
    });
    count++;
    console.log(sortable)
  });
};
export { initKanbanSortable };