export default {
    name: 'upload-mixin',
    methods: {
        triggerUpload(input) {
            this.$refs[input].click()
        },
        preparePreview(image) {
            return URL.createObjectURL(image)
        },
        fetchFile(event) {
            return event.target.files[0] && event.target.files[0].type.includes("image/")
                ? event.target.files[0]
                : ''
        }
    }
}
