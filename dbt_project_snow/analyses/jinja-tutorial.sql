{%- set name = "Arijit Jana" -%}

{{ name }}


{# Loops #}

{%- set apples = ["gala", "red delicious", "granny smith", "fuji", "honeycrisp", "mcintosh"] -%}

{% for apple in apples %}
    {% if apple != "mcintosh" %}
        {{ apple }}
    {% else %}
        {{ "This is the last apple in the list" }}
    {% endif %}
    
    {# {{ apple }} #}
{% endfor %}