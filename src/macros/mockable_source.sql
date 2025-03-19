{% macro mockable_source(source_name, table_name) %}
    {%- set target_name = target.name.lower() -%}
    {% if target_name in ['ci','default', 'dev'] and var('test_from_sample') %}
        {{ ref("sample_"~table_name) }}
    {% else %}
        {{ source(source_name, table_name) }}
    {% endif %}
{% endmacro %}