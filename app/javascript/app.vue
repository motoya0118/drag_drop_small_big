<template>
  <!-- <draggable v-model="bigs" :options='bigoption' @end="listMoved">
    <div v-for="big in bigs">{{big.name}}</div>
  </draggable> -->
  <draggable v-model="lists" :options="{group: 'lists'}" class="board dragArea" @end="listMoved" @change="Added">
    <list v-for="(list, index) in lists" :list="list" @delete="deleteBig(index,list.id)"><div class="small"></div></list>
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
    }
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
    deleteBig: function(index_big,id){
      this.lists.splice(index_big,1)
      Rails.ajax({
        url: `/kanban_bigs/${id}`,
        type: "DELETE",
        dataType: "json",
      })
    },
    Added: function(event){
      if (event.added){
        var data = new FormData
        data.append("kanban[position]", event.added.newIndex + 1)
        data.append("kanban[name]", this.lists[event.added.newIndex].name)
        data.append("kanban[kanban_id]", window.store.id)
        this.lists[event.added.newIndex].kanban_smalls.splice(0,1)
        Rails.ajax({
          url: `/kanban_bigs`,
          type: "POST",
          data: data,
          dataType: "json",
      })
      }
    }
  }
}
</script>

<style scoped>
.board{
  overflow-x: auto;
  white-space: nowrap;
}


</style>
