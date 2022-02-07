import 'vuetify/lib/styles/main.sass'
import "@mdi/font/scss/materialdesignicons.scss";
import { createVuetify } from 'vuetify'
import * as components from 'vuetify/lib/components'
import * as directives from 'vuetify/lib/directives'
import { aliases, mdi } from "vuetify/lib/iconsets/mdi"

export default createVuetify({
    defaultSet: "mdi",
    aliases,
    sets: {
        mdi,
    },
    components,
    directives
})
