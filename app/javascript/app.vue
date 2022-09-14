<template>
  <!-- <draggable v-model="bigs" :options='bigoption' @end="listMoved">
    <div v-for="big in bigs">{{big.name}}</div>
  </draggable> -->
  <draggable v-model="lists" :options="{group: 'lists'}" class="board dragArea" @end="listMoved">
    <list v-for="(list, index) in lists" :list="list"></list>
  </draggable>
</template>

<script>
import draggable from 'vuedraggable'
import list from './components/list'

export default {
  components: { draggable, list },

  props:["original_lists"],

  data() {return{
      lists: this.original_lists,
      bigs: [{name: "大"}],
      bigoption:{
        group:{
          name:"lists",
          pull: "clone",
          put: false
        },
        sort: false
    }}
  },
  methods: {
    listMoved: function(event) {
      var data = new FormData
      data.append("kanban[position]", event.newIndex + 1)
      

      Rails.ajax({
        url: `/kanban_bigs/${this.lists[event.newIndex].id}/move`,
        type: "PATCH",
        data: data,
        dataType: "json",
      })
    },
    
  }
}
</script>

<style scoped>
.board{
  overflow-x: auto;
  white-space: nowrap;
}


</style>
