<template>
  <!-- <draggable v-model="cards" :options="{group: 'cards'}" class="dragArea" @change="cardMoved">
    <div v-for="(card, index) in small.cards" class="card card-body" @dblclick="deleteCard(card.id)" @dblclick.stop="deleteSmall">
      {{ card.content }}
    </div>
  </draggable> -->
  <div class="card card-body" @dblclick.stop="$emit('delete', card.id)">
    {{ card.content }}
  </div>
</template>

<script>
  export default{
    props: ["card"],
  }
</script>

<style scoped>
.card {
  background-color: white;
  margin-bottom: 4px;
  padding: 16px;
  cursor: grab;
  word-break: break-all;
  overflow-wrap : break-word;
}
</style>