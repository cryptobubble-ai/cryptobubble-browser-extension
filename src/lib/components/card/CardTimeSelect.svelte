<script>
  import CardTimeSelectToggle from "./CardTimeSelectToggle.svelte";

  let { selected = $bindable("three_months") } = $props();
</script>

<div class="card-header">
  <div class="subtitle">Select a Forecast Window</div>
  <CardTimeSelectToggle bind:selected />
</div>

<style>
  .card-header {
    display: flex;
    align-items: center;
    justify-content: space-between;
    gap: 0.75rem;
  }

  .subtitle {
    color: #b7e7e5;
    font-size: 0.75rem;
    letter-spacing: 0.2px;
  }
</style>
