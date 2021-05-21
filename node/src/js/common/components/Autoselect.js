import React from 'react';
import Select from "react-select"
import PropTypes from 'prop-types';

class Autoselect extends React.Component {
    constructor() {
        super()
    }

    render() {
        const customStyle = {
            container: () => ({
                boxShadow: "3px 3px 7px 1px rgba(228, 228, 228, 0.81);",
                borderRadius: 5
            }),
        }

        return (
            <Select
                styles={customStyle}
                placeholder=""
                value={this.props.value}
                onChange={this.props.handleChange}
                getOptionLabel={this.props.getOptionLabel}
                getOptionValue={this.props.getOptionValue}
                options={this.props.options}
            />
        )
    }
}


Autoselect.propTypes = {
    value: PropTypes.object,
    onChange: PropTypes.func,
    getOptionLabel: PropTypes.func,
    getOptionValue: PropTypes.func,
    options: PropTypes.arrayOf(PropTypes.object).isRequired,
}

Autoselect.defaultProps = {
    getOptionValue: option => option.id,
    getOptionLabel: option => option.name
};

export default Autoselect
