<template>
  <div class="list">
      <h6>{{ list.name }}</h6>
      <hr />

      <draggable v-model="list.kanban_smalls" :options="{group: 'smalls'}" class="dragArea" @change="smallMoved">
        <div v-for="(small, index) in list.kanban_smalls" class="small small-body mb-3">
          {{ small.name }}
          <draggable v-model="small.cards" :options="{group: 'cards'}" class="dragArea" @change="cardMoved">
            <div v-for="(card, index) in small.cards" class="card card-body mb-3">
              {{ card.content }}
            </div>
          </draggable>
        </div>
      </draggable>
      
      <!-- <a v-if="!editing" v-on:click="startEditing">Add a card</a>
      <textarea v-if="editing" ref="message" v-model="message" class="form-control" ></textarea>
      <button v-if="editing" v-on:click="submitMessage" class="btn btn-secondary">Add</button>
      <a v-if="editing" v-on:click="editing=false">Cancel</a> -->
  </div>
</template>

<script>
import draggable from 'vuedraggable'

export default{
  components: { draggable },
  props: ["list"],

  data: function(){
      return {
          editing: false,
          message: ""
      }
  },

  methods: {
    smallMoved: function(event) {
          const evt = event.added || event.moved
          if (evt == undefined){ return }

          const element = evt.element
          const list_index = window.store.lists.findIndex((list) => {
              return list.kanban_smalls.find((big) => {
              return big.id == element.id
              })
          })

          var data = new FormData
          data.append("small[kanban_big_id]", window.store.lists[list_index].id)
          data.append("small[position]", evt.newIndex + 1)
          console.log(`list_index:${list_index}, element.id:${element.id}`)
          Rails.ajax({
              url: `/kanban_smalls/${element.id}/move`,
              type: "PATCH",
              data: data,
              dataType: "json",
          })
      },
      cardMoved: function(event) {
          const evt = event.added || event.moved
          if (evt == undefined){ return }

          const element = evt.element
          // const list_index = window.store.lists.findIndex((list) => {
          //     return list.kanban_smalls.findIndex((small) => {
          //       return small.cards.find((card)=>{
          //         card.id = element.id
          //       })
          //       })
          // })
            window.store.lists.forEach(big => {
              big.kanban_smalls.forEach(small =>{
                small.cards.forEach(card =>{
                  if (card.id == element.id){
                    var data = new FormData
                    data.append("card[kanban_small_id]",small.id)
                    data.append("card[position]", evt.newIndex + 1)

                    Rails.ajax({
                      url: `/cards/${element.id}/move`,
                      type: "PATCH",
                      data: data,
                      dataType: "json",
                    })
                  }
                })
              })              
            });
          
          // const small_index = window.store.lists.findIndex((list) => {
          //     return list.ids.find((card) => {
          //     return card.id == element.id
          //     })
          // })

          
      },
  }
}
</script>

<style scoped>
.dragArea{
  min-height: 20px;
}
  
.list{
  background: #E2E4E6;
  border-radius: 3px;
  display: inline-block;
  margin-right: 20px;
  padding: 10px;
  vertical-align: top;
  width: 270px;
}
</style>