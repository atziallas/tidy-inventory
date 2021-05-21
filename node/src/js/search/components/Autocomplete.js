import React from 'react'
import Autosuggest from "react-autosuggest";
import '../../../scss/autosuggest.css'
import PropTypes from 'prop-types';

class Autocomplete extends React.Component {
    constructor() {
        super()
        this.getSuggestionValue = this.getSuggestionValue.bind(this)
        this.onSuggestionSelected = this.onSuggestionSelected.bind(this)
        this.onChange = this.onChange.bind(this)
        this.state = {
            value: '',
        };
    }

    onSuggestionSelected(event,details) {
        this.props.valueChanged(details.suggestion.pk)
    }

    //state value changes on when a suggestion is selected
    onChange(event, {newValue}) {
        this.setState({
            value: newValue
        });
        this.props.valueChanged('')
    };

    getSuggestionValue(suggestion) {
        return suggestion.fields.name
    }

    renderSuggestion(suggestion) {
        return (
            <div>{suggestion.fields.name}</div>
        )
    }

    render() {
        const inputProps = {
            placeholder: "search",
            value: this.state.value,
            onChange: this.onChange
        };
        return (
            <Autosuggest
                suggestions={this.props.suggestions}
                onSuggestionSelected={this.onSuggestionSelected}
                onSuggestionsFetchRequested={this.props.fetchSuggestions}
                onSuggestionsClearRequested={this.props.clearSuggestions}
                getSuggestionValue={this.getSuggestionValue}
                renderSuggestion={this.renderSuggestion}
                inputProps={inputProps}
            />
        )
    }
}

Autocomplete.propTypes = {
    suggestions: PropTypes.array,
    fetchSuggestions: PropTypes.func,
    clearSuggestions: PropTypes.func,
    value: PropTypes.string,
    valueChanged: PropTypes.func
};

export default Autocomplete
