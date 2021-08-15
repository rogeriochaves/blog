hexo.extend.filter.register('before_post_render', (data) => {
    const filename = `${data.date.format("YYYY-MM-DD")}-${data.slug}.md`;
    data.content = data.content.replace("%%filename%%", filename);
    return data;
});