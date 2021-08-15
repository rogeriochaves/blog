hexo.extend.filter.register('before_post_render', (data) => {
    data.content = data.content.replace(/\$\$([\s\S]+?)\$\$/mg, "{% katex %}$1{% endkatex %}");
    return data;
});