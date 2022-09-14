<template>
  <div>
    <draggable v-model="lists" :options="{group: 'lists'}" class="board dragArea" @end="listMoved">
      <list v-for="(list, index) in lists" :list="list" :key="index"></list>
    </draggable>
  </div>
  <!-- <draggable v-model="bigs" :options='bigoption' @end="listMoved">
    <div v-for="big in bigs">{{big.name}}</div>
  </draggable> -->
  
</template>

<script>
import draggable from 'vuedraggable'
import list from './components/list'

export default {
  components: { draggable, list },

  // props:["original_lists"],

  data() {
    return {
      // lists: this.original_lists,
      lists: [
        {
          "name": "John",
          "id": 0,
          "kanban_smalls": [
            {
              "id": 1,
              "name": "small1",
              "cards": [
                {
                  "content": "コンテンツ1",
                  "id": 1
                },
                {
                  "content": "コンテンツ2",
                  "id": 2
                }
              ]
            },
            {
              "id": 2,
              "name": "small2",
              "cards": [
                {
                  "content": "コンテンツ2-1",
                  "id": 3
                },
                {
                  "content": "コンテンツ2-2",
                  "id": 4
                }
              ]
            }
          ]
        },
      ],
      bigs: [{name: "大"}],
      bigoption:{
        group:{
          name:"lists",
          pull: "clone",
          put: false
        },
        sort: false
      },
    inputText: "",
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
    
  }
}
</script>

<style scoped>
.board{
  overflow-x: auto;
  white-space: nowrap;
}


</style>
