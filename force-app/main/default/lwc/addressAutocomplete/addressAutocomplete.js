import { LightningElement, track } from 'lwc';

export default class AddressAutocomplete extends LightningElement {
    @track inputValue = '';
    @track suggestions = [];
    @track showSuggestions = false;

    handleInputChange(event) {
        this.inputValue = event.target.value;
        if (this.inputValue.length >= 3) {
            this.searchAddresses();
        } else {
            this.suggestions = [];
            this.showSuggestions = false;
        }
    }

    async searchAddresses() {
        const query = this.inputValue;
        try {
            // Make an HTTP request to Nominatim API
            const response = await fetch(`https://nominatim.openstreetmap.org/search?format=json&q=${query}`);
            const data = await response.json();
            if (data && data.length > 0) {
                this.suggestions = data.map(item => ({
                    place_id: item.place_id,
                    display_name: item.display_name,
                }));
                this.showSuggestions = true;
            } else {
                this.suggestions = [];
                this.showSuggestions = false;
            }
        } catch (error) {
            console.error('Error fetching address suggestions:', error);
        }
    }

    handleInputBlur() {
        // Hide suggestions when input field loses focus
        this.suggestions = [];
        this.showSuggestions = false;
    }

    handleSuggestionClick(event) {
        this.inputValue = event.target.textContent;
        this.suggestions = [];
        this.showSuggestions = false;
    }
}