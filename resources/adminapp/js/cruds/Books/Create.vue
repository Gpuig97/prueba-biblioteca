<template>
  <div class="container-fluid">
    <form @submit.prevent="submitForm">
      <div class="row">
        <div class="col-md-12">
          <div class="card">
            <div class="card-header card-header-primary card-header-icon">
              <div class="card-icon">
                <i class="material-icons">add</i>
              </div>
              <h4 class="card-title">
                {{ $t('global.create') }}
                <strong>{{ $t('cruds.book.title_singular') }}</strong>
              </h4>
            </div>
            <div class="card-body">
              <back-button></back-button>
            </div>
            <div class="card-body">
              <bootstrap-alert />
              <div class="row">
                <div class="col-md-12">
                  <div
                    class="form-group bmd-form-group"
                    :class="{
                      'has-items': entry.name,
                      'is-focused': activeField == 'name'
                    }"
                  >
                    <label class="bmd-label-floating required">{{
                      $t('cruds.book.fields.name')
                    }}</label>
                    <input
                      class="form-control"
                      type="text"
                      :value="entry.name"
                      @input="updateName"
                      @focus="focusField('name')"
                      @blur="clearFocus"
                      required
                    />
                  </div>
                  <div
                    class="form-group bmd-form-group"
                    :class="{
                      'has-items': entry.release_date,
                      'is-focused': activeField == 'release_date'
                    }"
                  >
                    <label class="bmd-label-floating required">{{
                      $t('cruds.book.fields.release_date')
                    }}</label>
                    <datetime-picker
                      class="form-control"
                      type="text"
                      picker="date"
                      :value="entry.release_date"
                      @input="updateReleaseDate"
                      @focus="focusField('release_date')"
                      @blur="clearFocus"
                      required
                    >
                    </datetime-picker>
                  </div>
                  <div
                    class="form-group bmd-form-group"
                    :class="{
                      'has-items': entry.book_type_id !== null,
                      'is-focused': activeField == 'book_type'
                    }"
                  >
                    <label class="bmd-label-floating required">{{
                      $t('cruds.book.fields.book_type')
                    }}</label>
                    <v-select
                      name="book_type"
                      label="name"
                      :key="'book_type-field'"
                      :value="entry.book_type_id"
                      :options="lists.book_type"
                      :reduce="entry => entry.id"
                      @input="updateBookType"
                      @search.focus="focusField('book_type')"
                      @search.blur="clearFocus"
                    />
                  </div>
                  <div
                    class="form-group bmd-form-group"
                    :class="{
                      'has-items': entry.book_category.length !== 0,
                      'is-focused': activeField == 'book_category'
                    }"
                  >
                    <label class="bmd-label-floating required">{{
                      $t('cruds.book.fields.book_category')
                    }}</label>
                    <v-select
                      name="book_category"
                      label="name"
                      :key="'book_category-field'"
                      :value="entry.book_category"
                      :options="lists.book_category"
                      :closeOnSelect="false"
                      multiple
                      @input="updateBookCategory"
                      @search.focus="focusField('book_category')"
                      @search.blur="clearFocus"
                    />
                  </div>
                </div>
              </div>
            </div>
            <div class="card-footer">
              <vue-button-spinner
                class="btn-primary"
                :status="status"
                :isLoading="loading"
                :disabled="loading"
              >
                {{ $t('global.save') }}
              </vue-button-spinner>
            </div>
          </div>
        </div>
      </div>
    </form>
  </div>
</template>

<script>
import { mapGetters, mapActions } from 'vuex'

export default {
  data() {
    return {
      status: '',
      activeField: ''
    }
  },
  computed: {
    ...mapGetters('BooksSingle', ['entry', 'loading', 'lists'])
  },
  mounted() {
    this.fetchCreateData()
  },
  beforeDestroy() {
    this.resetState()
  },
  methods: {
    ...mapActions('BooksSingle', [
      'storeData',
      'resetState',
      'setName',
      'setReleaseDate',
      'setBookType',
      'setBookCategory',
      'fetchCreateData'
    ]),
    updateName(e) {
      this.setName(e.target.value)
    },
    updateReleaseDate(e) {
      this.setReleaseDate(e.target.value)
    },
    updateBookType(value) {
      this.setBookType(value)
    },
    updateBookCategory(value) {
      this.setBookCategory(value)
    },
    submitForm() {
      this.storeData()
        .then(() => {
          this.$router.push({ name: 'books.index' })
          this.$eventHub.$emit('create-success')
        })
        .catch(error => {
          this.status = 'failed'
          _.delay(() => {
            this.status = ''
          }, 3000)
        })
    },
    focusField(name) {
      this.activeField = name
    },
    clearFocus() {
      this.activeField = ''
    }
  }
}
</script>
