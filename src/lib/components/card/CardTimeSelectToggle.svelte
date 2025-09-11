<script>
  let { selected = $bindable("three_months") } = $props();
</script>

<div class="toggle">
  <label class="tf" class:active={selected === "three_months"}>
    <input type="radio" bind:group={selected} value="three_months" />
    3 Months
  </label>
  <label class="tf" class:active={selected === "six_months"}>
    <input type="radio" bind:group={selected} value="six_months" />
    6 Months
  </label>
  <label class="tf" class:active={selected === "twelve_months"}>
    <input type="radio" bind:group={selected} value="twelve_months" />
    12 Months
  </label>
</div>

<style>
  .toggle {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 6px;
  }

  .tf {
    padding: 6px 8px;
    border-radius: 0.5rem;
    border: 1px solid rgba(152, 255, 240, 0.24);
    background: rgba(10, 24, 26, 0.6);
    color: #bff6f0;
    cursor: pointer;
    transition: all 0.15s ease;
    font-size: 11px;
    display: flex;
    align-items: center;
    justify-content: center;
  }

  .tf input {
    display: none;
  }

  .tf:hover {
    border-color: rgba(152, 255, 240, 0.5);
    color: #e9fcfb;
  }

  .tf.active {
    background: linear-gradient(180deg, #1c6b60 0%, #134d45 100%);
    color: #eafff9;
    border-color: rgba(152, 255, 240, 0.7);
    box-shadow: 0 0 0 1px rgba(152, 255, 240, 0.25) inset;
  }
</style>
