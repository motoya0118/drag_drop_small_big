<template>
  <div class="list" @dblclick="deleteBig(list.id)">
      <h6>{{ list.name }}</h6>
      <hr />
      
      <draggable v-model="list.kanban_smalls" :options="{group: 'smalls'}" class="dragArea" @change="smallMoved">
        <Small v-for="(small, index) in list.kanban_smalls" :key="index" :small="small" :deleteCard="deleteCard" @delete="deleteSmall" />
        <!-- <div v-for="(small, index) in list.kanban_smalls" class="small small-body" @dblclick="deleteSmall(small.id)" @dblclick.stop="deleteBig">
          {{ small.name }}
          <draggable v-model="small.cards" :options="{group: 'cards'}" class="dragArea" @change="cardMoved">
            <div v-for="(card, index) in small.cards" class="card card-body" @dblclick="deleteCard(card.id)" @dblclick.stop="deleteSmall">
              {{ card.content }}
            </div>
          </draggable> 
        </div>-->
      </draggable>
      
      <!-- <a v-if="!editing" v-on:click="startEditing">Add a card</a>
      <textarea v-if="editing" ref="message" v-model="message" class="form-control" ></textarea>
      <button v-if="editing" v-on:click="submitMessage" class="btn btn-secondary">Add</button>
      <a v-if="editing" v-on:click="editing=false">Cancel</a> -->
  </div>
</template>

<script>
import draggable from 'vuedraggable'
import Small from './Small'

export default{
  components: { draggable, Small },
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
          // if (evt == undefined){ return }

          // const element = evt.element
          // const list_index = window.store.lists.findIndex((list) => {
          //     return list.kanban_smalls.find((big) => {
          //     return big.id == element.id
          //     })
          // })

          // var data = new FormData
          // data.append("small[kanban_big_id]", window.store.lists[list_index].id)
          // data.append("small[position]", evt.newIndex + 1)
          // console.log(`list_index:${list_index}, element.id:${element.id}`)
          // Rails.ajax({
          //     url: `/kanban_smalls/${element.id}/move`,
          //     type: "PATCH",
          //     data: data,
          //     dataType: "json",
          // })
      },
      cardMoved: function(event) {
        console.log(event)
        // const evt = event.added || event.moved
        // if (evt == undefined){ return }
        // const element = evt.element
        //   window.store.lists.forEach(big => {
        //     big.kanban_smalls.forEach(small =>{
        //       small.cards.forEach(card =>{
        //         if (card.id == element.id){
        //           var data = new FormData
        //           data.append("card[kanban_small_id]",small.id)
        //           data.append("card[position]", evt.newIndex + 1)
        //           Rails.ajax({
        //             url: `/cards/${element.id}/move`,
        //             type: "PATCH",
        //             data: data,
        //             dataType: "json",
        //           })
        //         }
        //       })
        //     })              
        //   });
        },
        deleteCard: function(dbl_card) {
          debugger;
          // window.store.lists.forEach( big => {
          //   big.kanban_smalls.forEach( small =>{
          //     small.cards.forEach( card =>{
          //       if (card.id == dbl_card){
          //         console.log('dt')
          //         const card_index = small.cards.indexOf(card)
          //         const small_index = big.kanban_smalls.indexOf(small)
          //         this.list.kanban_smalls[small_index].cards.splice(card_index,1)
          //         // Rails.ajax({
          //         //   url: `/cards/${card.id}`,
          //         //   type: "DELETE",
          //         //   dataType: "json",
          //         // })
          //         }
          //       })
          //     }
          //   )}
          // )
        },
        deleteSmall: function(dbl_small) {
          debugger;
          console.log(dbl_small)
          // window.store.lists.forEach( big => {
          //   big.kanban_smalls.forEach( small =>{
          //     if (small.id == dbl_small){
          //       const small_index = big.kanban_smalls.indexOf(small)
          //       this.list.kanban_smalls.splice(small_index,1)
          //       // Rails.ajax({
          //       //   url: `/kanban_smalls/${small.id}`,
          //       //   type: "DELETE",
          //       //   dataType: "json",
          //       //   })
          //       }
          //     })
          //   }
          // )
        },
          deleteBig: function(dbl_big) {
            console.log(this.$destroy())
            this.list = null
            // Rails.ajax({
            //   url: `/kanban_bigs/${dbl_big}`,
            //   type: "DELETE",
            //   dataType: "json",
            //   })
            }
        },
        

  }
</script>

<style scoped>
.dragArea{
  min-height: 20px;
}
  
.list{
  list-style: none;
  border-style: solid;
  border-color: red;
  background: #E2E4E6;
  border-radius: 3px;
  display: inline-block;
  margin-right: 20px;
  padding: 10px;
  vertical-align: top;
  width: 270px;
}
</style>