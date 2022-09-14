<template>
  <div class="small small-body" @dblclick.stop="$emit('delete', small.id)">
    <h6>{{ small.name }}</h6>
    
    <draggable v-model="small.cards" :options="{group: 'smalls'}" class="dragArea">
       <Card v-for="(card, index) in small.cards" :key="index" :card="card" @delete="deleteCard" />
    </draggable>
  </div>
     <!-- <div v-for="(small, index) in list.kanban_smalls" class="small small-body" @dblclick="deleteSmall(small.id)" @dblclick.stop="deleteBig">
      {{ small.name }}
      <draggable v-model="small.cards" :options="{group: 'cards'}" class="dragArea" @change="cardMoved">
        <div v-for="(card, index) in small.cards" class="card card-body" @dblclick="deleteCard(card.id)" @dblclick.stop="deleteSmall">
          {{ card.content }}
        </div>
      </draggable>
    </div> -->
</template>

<script>
  import draggable from 'vuedraggable'
  import Card from './card'
  
  export default{
    components: { draggable, Card },
    props: {
      small: {
        type: Object
      },
      deleteCard: {
        type: Function
      }
    }
  }
</script>

<style scoped>
.small {
  list-style: none;
  width: 200px;
  padding: 0;
  margin: 8px;
  border-style: solid;
  border-color: blue;
  background: yellow;
}
</style>
