<template>
  <div class="wrapper-paginate">
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
.wrapper-paginate .paginate-buttons {
  width: 40px;
  height: 40px;
  cursor: pointer;
  background-color: #e4f6fe;
  border: none;
}

.wrapper-paginate .back-button,
.wrapper-paginate .next-button {
  margin-inline: 10px;
  border-radius: 25px;
}

.wrapper-paginate .first-button {
  border-start-start-radius: 25px;
  border-end-start-radius: 25px;
}
.wrapper-paginate .last-button {
  border-start-end-radius: 25px;
  border-end-end-radius: 25px;
}

.wrapper-paginate .back-button svg {
  transform: rotate(180deg) translateY(-2px);
}
.wrapper-paginate .next-button svg {
  transform: translateY(2px);
}

/* select second element of .paginate-buttons */
.wrapper-paginate li:nth-child(2) > .paginate-buttons.number-buttons {
  border-start-start-radius: 25px;
  border-end-start-radius: 25px;
  transition: none;
}

/* select one element before last of .paginate-buttons */
.wrapper-paginate li:nth-last-child(2) > .paginate-buttons.number-buttons {
  border-start-end-radius: 25px;
  border-end-end-radius: 25px;
}

.wrapper-paginate .active-page {
  background-color: #f379a7;
  color: #fff;
}

.wrapper-paginate .active-page {
  background-color: #f379a7;
  color: #fff;
}

.wrapper-paginate .paginate-buttons:hover {
  background-color: #f5f5f5;
}

.wrapper-paginate .active-page:hover {
  background-color: #f379a7;
}
.wrapper-paginate .back-button:active,
.wrapper-paginate .next-button:active {
  background-color: #e6e6e6;
}
</style>

