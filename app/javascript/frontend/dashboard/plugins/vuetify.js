import 'vuetify/lib/styles/main.css'
import "@mdi/font/css/materialdesignicons.min.css"
import { createVuetify } from 'vuetify'
import * as components from 'vuetify/lib/components'
import * as directives from 'vuetify/lib/directives'
import { aliases, mdi } from "vuetify/lib/iconsets/mdi"
import colors from 'vuetify/lib/util/colors'

export default createVuetify({
    defaultSet: "mdi",
    theme: {
        themes: {
            light: {
                colors: {
                    primary: colors.blue.darken2,
                    secondary: '#5CBBF6',
                    'secondary-dark-blue': '#42A5F5',
                    white: '#FFFFFF'
                }
            },
            dark: {
                colors: {
                    surface: '#424242',
                }
            }
        },
    },
    aliases,
    sets: {
        mdi,
    },
    components,
    directives
})
