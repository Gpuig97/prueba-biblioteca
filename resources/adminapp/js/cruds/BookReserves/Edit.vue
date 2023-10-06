<template>
  <div class="container-fluid">
    <form @submit.prevent="submitForm">
      <div class="row">
        <div class="col-md-12">
          <div class="card">
            <div class="card-header card-header-primary card-header-icon">
              <div class="card-icon">
                <i class="material-icons">edit</i>
              </div>
              <h4 class="card-title">
                {{ $t('global.edit') }}
                <strong>{{ $t('cruds.bookReserf.title_singular') }}</strong>
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
                      $t('cruds.bookReserf.fields.book')
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
                      $t('cruds.bookReserf.fields.location')
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
                      'has-items': entry.date_from,
                      'is-focused': activeField == 'date_from'
                    }"
                  >
                    <label class="bmd-label-floating required">{{
                      $t('cruds.bookReserf.fields.date_from')
                    }}</label>
                    <datetime-picker
                      class="form-control"
                      type="text"
                      picker="date"
                      :value="entry.date_from"
                      @input="updateDateFrom"
                      @focus="focusField('date_from')"
                      @blur="clearFocus"
                      required
                    >
                    </datetime-picker>
                  </div>
                  <div
                    class="form-group bmd-form-group"
                    :class="{
                      'has-items': entry.date_to,
                      'is-focused': activeField == 'date_to'
                    }"
                  >
                    <label class="bmd-label-floating required">{{
                      $t('cruds.bookReserf.fields.date_to')
                    }}</label>
                    <datetime-picker
                      class="form-control"
                      type="text"
                      picker="date"
                      :value="entry.date_to"
                      @input="updateDateTo"
                      @focus="focusField('date_to')"
                      @blur="clearFocus"
                      required
                    >
                    </datetime-picker>
                  </div>
                  <div
                    class="form-group bmd-form-group"
                    :class="{
                      'has-items': entry.quantity,
                      'is-focused': activeField == 'quantity'
                    }"
                  >
                    <label class="bmd-label-floating required">{{
                      $t('cruds.bookReserf.fields.quantity')
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
                  <div
                    class="form-group bmd-form-group"
                    :class="{
                      'has-items': entry.user_id !== null,
                      'is-focused': activeField == 'user'
                    }"
                  >
                    <label class="bmd-label-floating required">{{
                      $t('cruds.bookReserf.fields.user')
                    }}</label>
                    <v-select
                      name="user"
                      label="name"
                      :key="'user-field'"
                      :value="entry.user_id"
                      :options="lists.user"
                      :reduce="entry => entry.id"
                      @input="updateUser"
                      @search.focus="focusField('user')"
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
    ...mapGetters('BookReservesSingle', ['entry', 'loading', 'lists'])
  },
  beforeDestroy() {
    this.resetState()
  },
  watch: {
    '$route.params.id': {
      immediate: true,
      handler() {
        this.resetState()
        this.fetchEditData(this.$route.params.id)
      }
    }
  },
  methods: {
    ...mapActions('BookReservesSingle', [
      'fetchEditData',
      'updateData',
      'resetState',
      'setBook',
      'setLocation',
      'setDateFrom',
      'setDateTo',
      'setQuantity',
      'setUser'
    ]),
    updateBook(value) {
      this.setBook(value)
    },
    updateLocation(value) {
      this.setLocation(value)
    },
    updateDateFrom(e) {
      this.setDateFrom(e.target.value)
    },
    updateDateTo(e) {
      this.setDateTo(e.target.value)
    },
    updateQuantity(e) {
      this.setQuantity(e.target.value)
    },
    updateUser(value) {
      this.setUser(value)
    },
    submitForm() {
      this.updateData()
        .then(() => {
          this.$router.push({ name: 'book_reserves.index' })
          this.$eventHub.$emit('update-success')
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
