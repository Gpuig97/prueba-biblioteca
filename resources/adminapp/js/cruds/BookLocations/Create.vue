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
                <strong>{{ $t('cruds.bookLocation.title_singular') }}</strong>
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
                      'has-items': entry.book_id !== null,
                      'is-focused': activeField == 'book'
                    }"
                  >
                    <label class="bmd-label-floating required">{{
                      $t('cruds.bookLocation.fields.book')
                    }}</label>
                    <v-select
                      name="book"
                      label="name"
                      :key="'book-field'"
                      :value="entry.book_id"
                      :options="lists.book"
                      :reduce="entry => entry.id"
                      @input="updateBook"
                      @search.focus="focusField('book')"
                      @search.blur="clearFocus"
                    />
                  </div>
                  <div
                    class="form-group bmd-form-group"
                    :class="{
                      'has-items': entry.location_id !== null,
                      'is-focused': activeField == 'location'
                    }"
                  >
                    <label class="bmd-label-floating required">{{
                      $t('cruds.bookLocation.fields.location')
                    }}</label>
                    <v-select
                      name="location"
                      label="name"
                      :key="'location-field'"
                      :value="entry.location_id"
                      :options="lists.location"
                      :reduce="entry => entry.id"
                      @input="updateLocation"
                      @search.focus="focusField('location')"
                      @search.blur="clearFocus"
                    />
                  </div>
                  <div
                    class="form-group bmd-form-group"
                    :class="{
                      'has-items': entry.quantity,
                      'is-focused': activeField == 'quantity'
                    }"
                  >
                    <label class="bmd-label-floating required">{{
                      $t('cruds.bookLocation.fields.quantity')
                    }}</label>
                    <input
                      class="form-control"
                      type="number"
                      step="1"
                      :value="entry.quantity"
                      @input="updateQuantity"
                      @focus="focusField('quantity')"
                      @blur="clearFocus"
                      required
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
    ...mapGetters('BookLocationsSingle', ['entry', 'loading', 'lists'])
  },
  mounted() {
    this.fetchCreateData()
  },
  beforeDestroy() {
    this.resetState()
  },
  methods: {
    ...mapActions('BookLocationsSingle', [
      'storeData',
      'resetState',
      'setBook',
      'setLocation',
      'setQuantity',
      'fetchCreateData'
    ]),
    updateBook(value) {
      this.setBook(value)
    },
    updateLocation(value) {
      this.setLocation(value)
    },
    updateQuantity(e) {
      this.setQuantity(e.target.value)
    },
    submitForm() {
      this.storeData()
        .then(() => {
          this.$router.push({ name: 'book_locations.index' })
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
