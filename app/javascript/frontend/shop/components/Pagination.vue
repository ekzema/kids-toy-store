<template>
  <div class="example-four">
    <vue-awesome-paginate v-model="currentPage" :on-click="onClickHandler" :total-items="100">
      <template #prev-button>
        <span>
          <svg
              xmlns="http://www.w3.org/2000/svg"
              fill="black"
              width="12"
              height="12"
              viewBox="0 0 24 24"
          >
            <path d="M8.122 24l-4.122-4 8-8-8-8 4.122-4 11.878 12z" />
          </svg>
        </span>
      </template>

      <template #next-button>
        <span>
          <svg
              xmlns="http://www.w3.org/2000/svg"
              fill="black"
              width="12"
              height="12"
              viewBox="0 0 24 24"
          >
            <path d="M8.122 24l-4.122-4 8-8-8-8 4.122-4 11.878 12z" />
          </svg>
        </span>
      </template>
    </vue-awesome-paginate>
  </div>
</template>

<script>
export default {
  name: 'ShopPagination',
  data() {
    return {
      currentPage: 1
    }
  },
  created () {
  },
  methods: {
    onClickHandler() {
      console.log('sdsd', this.currentPage)
    }
  }
}
</script>

<style>
.example-four .paginate-buttons {
  width: 40px;
  height: 40px;
  cursor: pointer;
  background-color: #e4f6fe;
  border: none;
}

.example-four .back-button,
.example-four .next-button {
  margin-inline: 10px;
  border-radius: 25px;
}

.example-four .first-button {
  border-start-start-radius: 25px;
  border-end-start-radius: 25px;
}
.example-four .last-button {
  border-start-end-radius: 25px;
  border-end-end-radius: 25px;
}

.example-four .back-button svg {
  transform: rotate(180deg) translateY(-2px);
}
.example-four .next-button svg {
  transform: translateY(2px);
}

/* select second element of .paginate-buttons */
.example-four li:nth-child(2) > .paginate-buttons.number-buttons {
  border-start-start-radius: 25px;
  border-end-start-radius: 25px;
  transition: none;
}

/* select one element before last of .paginate-buttons */
.example-four li:nth-last-child(2) > .paginate-buttons.number-buttons {
  border-start-end-radius: 25px;
  border-end-end-radius: 25px;
}

.example-four .active-page {
  background-color: #f379a7;
  color: #fff;
}

.example-four .active-page {
  background-color: #f379a7;
  color: #fff;
}

.example-four .paginate-buttons:hover {
  background-color: #f5f5f5;
}

.example-four .active-page:hover {
  background-color: #f379a7;
}
.example-four .back-button:active,
.example-four .next-button:active {
  background-color: #e6e6e6;
}
</style>

