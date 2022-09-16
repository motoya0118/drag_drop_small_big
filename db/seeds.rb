# dragndrop_kanban_app/db/seed.rb
Card.destroy_all
KanbanSmall.destroy_all
KanbanBig.destroy_all
Kanban.destroy_all
my_kanban = Kanban.create(
  name: "New Lamborgucci project",
  description: "Project to build the most esthetically car ever made.",
);

unit1 = KanbanBig.create(
  name: "unit1",
  kanban_id: my_kanban.id,
  position: 0
)
unit2 = KanbanBig.create(
  name: "unit2",
  kanban_id: my_kanban.id,
  position: 1
)

backlog = KanbanSmall.create(
  name: "Backlog",
  kanban_big: unit1,
  position: 0
)
Card.create(content: "Build engine", position: 0, kanban_small: backlog)
Card.create(content: "Purchase the tires", position: 1, kanban_small: backlog)
Card.create(content: "Code the cockpit software", position: 2, kanban_small: backlog)

todo = KanbanSmall.create(
  name: "To Do",
  kanban_big: unit2,
  position: 1
)
Card.create(content: "Design the car", position: 0, kanban_small: todo)
completed = KanbanSmall.create(
  name: "Completed",
  kanban_big: unit2,
  position: 2
)
Card.create(content: "Build the engineer team", position: 0, kanban_small: completed)
Card.create(content: "Find fundings", position: 1, kanban_small: completed)