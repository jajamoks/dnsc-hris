/**
 * Add a "infinite scroll" functionality to any component using this mixin.
 * Such a component should:
 * - have the parent DOM element defined as "wrapper": v-el:wrapper
 * - have a `scrolling` method bound to `scroll` event on such element: @scroll="scrolling"
 * - have the array of all objects named as `items`, either as data, computed, or a prop
 */
export default {
    data() {
        return {
            numOfItems: 8, // Number of currently loaded and displayed items
            perPage: 8,    // Number of items to be loaded per "page"
        };
    },

    methods: {
        scrolling(e) {
            var $wrapper = $(this.$els.wrapper);

            // Here we check if the user has scrolled to the end of the wrapper (or 32px to the end).
            // If that's true, load more items.
            if ($wrapper.scrollTop() + $wrapper.innerHeight() >= $wrapper[0].scrollHeight - 32) {
                this.displayMore();
            }
        },

        displayMore() {
            this.numOfItems += this.perPage;

            if (this.numOfItems > this.items.length) {
                this.numOfItems = this.items.length;
            }
        },
    },
};
