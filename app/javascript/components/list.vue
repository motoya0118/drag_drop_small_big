<template>
  <div v-if="!list.edit" class="list" @dblclick="$emit('delete',list.id)" @click="list.edit=true">
    <h6>{{ list.name }}</h6>
    <hr />
    <draggable v-model="list.kanban_smalls" :options="{group: 'smalls'}" class="dragArea" @change="smallMoved">
      <div v-if="!small.edit" v-for="(small, index) in list.kanban_smalls" class="small small-body" @dblclick.stop="deleteSmall(small.id)" @click.stop="small.edit = true">
        {{ small.name }}
        <draggable v-model="small.cards" :options="{group: 'cards'}" class="dragArea" @change="cardMoved">
          <div v-if="!card.edit" v-for="(card, index) in small.cards" class="card card-body" @dblclick.stop="deleteCard(card.id)" @click.stop="card.edit = true">
            {{ card.content }}
          </div>
          <input v-else type="text" class="form-control" v-model="card.content" v-on:blur="cardBlur(card)" v-focus></input>
        </draggable>
      </div>
      <input v-else type="text" class="form-control" v-model="small.name" v-on:blur="smallBlur(small)" v-focus></input>
    </draggable>
  </div>
  <input v-else type="text" class="form-control" v-model="list.name" v-on:blur="listBlur(list)" v-focus></input>
</template>

<script>
import draggable from 'vuedraggable'




export default{
  components: { draggable },
  props: ["list"],

  data: function(){
      return {
          edit: false,
          message: ""
      }
  },
  directives: {
        focus: {
            // ディレクティブ定義
            inserted: function (el) {
                el.focus();
            }
        }
    },
  methods: {
    smallMoved: function(event) {
      const evt = event.added || event.moved
      if (evt == undefined){ return }
        const element = evt.element
        if (element.flag == undefined){
          console.log('aaaaa')
          window.store.lists.forEach(big =>{
            big.kanban_smalls.forEach(small => {
              if(small.id == element.id){
                var data = new FormData
                data.append("small[kanban_big_id]", big.id)
                data.append("small[position]", evt.newIndex + 1)
                // console.log(`list_index:${list_index}, element.id:${element.id}`)a
                Rails.ajax({
                    url: `/kanban_smalls/${element.id}/move`,
                    type: "PATCH",
                    data: data,
                    dataType: "json",
                 })
                }
              })
            })          
          }else{
            window.store.lists.forEach(big => {
              big.kanban_smalls.forEach(small =>{
                if (small.id == undefined){
                  const big_index = window.store.lists.indexOf(big)
                  const small_index = big.kanban_smalls.indexOf(small)
                  // console.log(this.list.kanban_smalls[small_index])
                  this.list.kanban_smalls[small_index].cards.splice(0,1)
                  var data = new FormData
                  data.append("small[kanban_big_id]", window.store.lists[big_index].id)
                  data.append("small[position]", evt.newIndex + 1)
                  data.append("small[name]", small.name)
                  data.append("small[kanban_id]", window.store.id)
                  Rails.ajax({
                    url: `/kanban_smalls`,
                    type: "POST",
                    data: data,
                    dataType: "json",
                  })
                }
              })
            })
        }
      },
      cardMoved: function(event) {
        console.log(event)
        const evt = event.added || event.moved
        if (evt == undefined){ return }
        const element = evt.element
        if (element.flag == undefined){
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
        } else {
          window.store.lists.forEach(big => {
            big.kanban_smalls.forEach(small =>{
              small.cards.forEach(card =>{
                if (card.id == undefined){
                  var data = new FormData
                  console.log(card)
                  data.append("card[kanban_small_id]",small.id)
                  data.append("card[position]", evt.newIndex + 1)
                  data.append("card[content]", card.content)
                  data.append("card[kanban_id]", window.store.id)   
                  Rails.ajax({
                    url: `/cards`,
                    type: "POST",
                    data: data,
                    dataType: "json",
                  })
                }
              })
            })
          })
        }
          
        },
        deleteCard: function(dbl_card) {
          window.store.lists.forEach( big => {
            big.kanban_smalls.forEach( small =>{
              small.cards.forEach( card =>{
                if (card.id == dbl_card){
                  console.log('dt')
                  const card_index = small.cards.indexOf(card)
                  const small_index = big.kanban_smalls.indexOf(small)
                  this.list.kanban_smalls[small_index].cards.splice(card_index,1)
                  Rails.ajax({
                    url: `/cards/${card.id}`,
                    type: "DELETE",
                    dataType: "json",
                  })
                  }
                })
              }
            )}
          )
        },
        deleteSmall: function(dbl_small) {
        console.log(dbl_small)
          window.store.lists.forEach( big => {
            big.kanban_smalls.forEach( small =>{
              if (small.id == dbl_small){
                const small_index = big.kanban_smalls.indexOf(small)
                console.log(`small_index:${small_index}`)
                this.list.kanban_smalls.splice(small_index,1)
                Rails.ajax({
                  url: `/kanban_smalls/${small.id}`,
                  type: "DELETE",
                  dataType: "json",
                  })
                }
              })
            }
          )},
        cardBlur: function(card){
          card.edit = false
          var data = new FormData
          data.append("card[content]", card.content)
          Rails.ajax({
                    url: `/cards/${card.id}/move`,
                    type: "PATCH",
                    data: data,
                    dataType: "json",
                  })
        },
        smallBlur: function(small){
          small.edit = false
          var data = new FormData
          data.append("small[name]", small.name)
          Rails.ajax({
                    url: `/kanban_smalls/${small.id}/move`,
                    type: "PATCH",
                    data: data,
                    dataType: "json",
                  })
        },
        listBlur: function(list){
          list.edit = false
          var data = new FormData
          data.append("kanban[name]", list.name)
          Rails.ajax({
                    url: `/kanban_bigs/${list.id}`,
                    type: "PATCH",
                    data: data,
                    dataType: "json",
                  })
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
.small {
  list-style: none;
  width: 200px;
  padding: 0;
  margin: 8px;
  border-style: solid;
  border-color: blue;
  background: yellow;
}
.card {
  background-color: white;
  margin-bottom: 4px;
  padding: 16px;
  cursor: grab;
  word-break: break-all;
  overflow-wrap : break-word;
}


</style>