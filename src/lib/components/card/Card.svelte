<script>
  import CardTimeSelect from "./CardTimeSelect.svelte";
  import CardResultBlock from "./CardResultBlock.svelte";
  import CardFooter from "./CardFooter.svelte";
  import CardReasoningTabs from "./CardReasoningTabs.svelte";

  let { data = null } = $props();

  let selected = $state("three_months");
  const tf = $derived(data ? data[selected] : null);
  const lastUpdated = $derived(data ? Date.parse(data.last_updated || data.time) : null);
</script>

<div class="card">
  <div class="time-select">
    <CardTimeSelect bind:selected />
  </div>

  {#if tf}
    <div class="result-block">
      <CardResultBlock probability={tf.bubble_burst_probability || 0} />
    </div>
    <div class="reasoning-block">
      <CardReasoningTabs marketOverview={tf.market_overview} catalysts={tf.bubble_burst_catalyst} />
    </div>
  {:else}
    <div class="result-block">
      <div class="reasoning-block">
        <CardReasoningTabs marketOverview="No data" catalysts={[]} />
      </div>
    </div>
  {/if}
  <div class="footer">
    <CardFooter lastUpdated={lastUpdated} />
  </div>
</div>

<style>
  .card {
    background: rgba(18, 40, 44, 0.7);
    border: 1px solid rgba(152, 255, 240, 0.12);
    border-radius: 0.5rem;
    box-shadow:
      0 10px 30px rgba(0, 0, 0, 0.35),
      inset 0 1px 0 rgba(255, 255, 255, 0.04);
    backdrop-filter: blur(8px);
    padding: 1rem;
  }

  .time-select {
    margin-left: 0.25rem;
    margin-right: 0.25rem;
  }

  .result-block {
    margin-top: 1rem;
  }

  .reasoning-block {
    margin-top: 1rem;
    margin-left: 0.25rem;
    margin-right: 0.25rem;
  }

  .footer {
    margin-top: 1rem;
    margin-left: 0.25rem;
    margin-right: 0.25rem;
  }
</style>
