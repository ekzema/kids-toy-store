<template>
  <div class="wrapper-paginate">
    <vue-awesome-paginate v-model="currentPage" :on-click="onClickHandler" :total-items="totalItems" :items-per-page="perPage">
      <template #prev-button>
        <span>
          <i class="fa fa-angle-left"></i>
        </span>
      </template>

      <template #next-button>
        <span>
          <i class="fa fa-angle-right"></i>
        </span>
      </template>
    </vue-awesome-paginate>
  </div>
</template>

<script>
import { perPage } from '../config'

export default {
  name: 'ShopPagination',
  props: {
    page:{
      type: Number,
    },
    perPage: {
      type: Number,
      default: perPage
    },
    totalItems: {
      type: Number,
      default: 0
    }
  },
  data() {
    return {
      currentPage: 1
    }
  },
  watch: {
    page() {
      this.page ? this.currentPage = Number(this.page) : this.currentPage = 1
    }
  },
  created() {
    if (this.page) this.currentPage = Number(this.page)
  },
  methods: {
    onClickHandler(e) {
      this.$emit('paginationEvent', e)
    }
  }
}
</script>

<style scoped>
.wrapper-paginate {
  text-align: center;
}

.wrapper-paginate .pagination-container {
  margin-bottom: 0;
}

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

.wrapper-paginate li:nth-child(2) > .paginate-buttons.number-buttons {
  border-start-start-radius: 25px;
  border-end-start-radius: 25px;
  transition: none;
}

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

