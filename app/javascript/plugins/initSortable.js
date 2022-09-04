import Sortable from 'sortablejs';
const initKanbanSortable = (canElements,target) => {
  canElements.forEach((ul) => {
      new Sortable(ul, {
        group: 'can', // set both lists to same group
        animation: 300,
        handle: target,
        swapThreshold: 0,
    });
  });
};
export { initKanbanSortable };