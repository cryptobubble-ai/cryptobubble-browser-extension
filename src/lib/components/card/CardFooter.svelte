<script>
    let { lastUpdated = null, linkHref = "https://cryptobubble.ai/en" } = $props();

    const updatedText = $derived(lastUpdated
        ? new Intl.DateTimeFormat('en-GB', {day: 'numeric', month: 'short', year: 'numeric'})
            .format(new Date(lastUpdated))
        : 'N/A');

    const linkWithUtm = $derived(linkHref.includes('?') 
        ? `${linkHref}&utm_source=chrome-extension`
        : `${linkHref}?utm_source=chrome-extension`);
</script>

<div class="footer">
    <div class="time">Last Updated: {updatedText}</div>
    <a class="link" href={linkWithUtm} target="_blank" rel="noopener" aria-label="Open full analysis in a new tab">
        Open full analysis
        <svg class="ext" viewBox="0 0 24 24" width="14" height="14" aria-hidden="true">
            <path fill="currentColor"
                  d="M14 3h7v7h-2V6.41l-9.29 9.3-1.42-1.42 9.3-9.29H14V3zM5 5h6v2H7v10h10v-4h2v6H5V5z"/>
        </svg>
    </a>
</div>

<style>
    .footer {
        display: flex;
        align-items: center;
        justify-content: space-between;
        font-size: 0.6875rem;
        color: #9ed8d3;
    }

    a.link {
        color: #7be0d6;
        text-decoration: none;
        display: inline-flex;
        align-items: center;
        gap: 0.25rem;
    }

    a.link:hover {
        text-decoration: underline;
    }

    .ext {
        opacity: 0.9;
    }
</style>
