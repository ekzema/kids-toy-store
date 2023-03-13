module.exports = {
    env: {
        node: true,
    },
    extends: [
        "eslint:recommended",
        "plugin:vue/vue3-recommended",
        "prettier"
    ],
    parserOptions: {
        "ecmaVersion": 2020
    },
    plugins: [
        "vue"
    ],
    rules: {
        "vue/require-default-prop": "off",
        "generator-star-spacing": "off",
        "vue/v-on-event-hyphenation": "off",
        "vue/require-prop-types": "off"
    }
}
