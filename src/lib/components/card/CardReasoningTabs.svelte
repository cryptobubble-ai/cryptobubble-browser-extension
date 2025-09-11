<script>
    let { marketOverview = "", catalysts = [] } = $props();

    let tab = $state("overview");
</script>

<div class="content">
    <div class="tabs" role="tablist">
        <button class="tab" class:active={tab === "overview"} role="tab" aria-selected={tab === "overview"}
                onclick={() => (tab = "overview")}>
            Market Overview
        </button>
        <button class="tab" class:active={tab === "risks"} role="tab" aria-selected={tab === "risks"}
                onclick={() => (tab = "risks")}>
            Potential Risks
        </button>
    </div>
    <div class="tab-content">
        {#if tab === "overview"}
            <div class="reasoning">
                {marketOverview || "No analysis available."}
            </div>
        {:else if catalysts && catalysts.length}
            <ul class="list">
                {#each catalysts as item, i}
                    <li>{item}</li>
                {/each}
            </ul>
        {:else}
            <div class="reasoning">
                No risk catalysts available.
            </div>
        {/if}
    </div>
</div>

<style>
    .tabs {
        display: flex;
        gap: 1rem;
        align-items: flex-end;
        position: relative;
    }

    .tabs::after {
        content: "";
        position: absolute;
        left: 0;
        right: 0;
        bottom: 0;
        height: 1px;
        background: rgba(152, 255, 240, 0.12);
    }

    .tab {
        position: relative;
        background: none;
        border: 0;
        color: #9ed8d3;
        cursor: pointer;
        font-size: 0.8125rem;
        padding-bottom: 0.5rem;
    }

    .tab:hover {
        color: #e9fcfb;
    }

    .tab.active {
        color: #eafff9;
    }

    .tab.active::after {
        content: "";
        position: absolute;
        left: 0;
        right: 0;
        bottom: 0;
        height: 2px;
        background: #2fd39b;
        border-radius: 1px;
    }

    .tab-content {
        padding-left: 0.25rem;
        padding-right: 0.25rem;
        padding-top: 0.75rem;
        font-size: 0.8125rem;
        line-height: 1.45;
        color: #d8f9f6;
        opacity: 0.95;
    }

    .list {
        margin: 0;
        padding-left: 1rem;
    }
</style>
