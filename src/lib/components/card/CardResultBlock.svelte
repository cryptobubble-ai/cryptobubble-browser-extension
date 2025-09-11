<script>
    let { probability = 0 } = $props();

    const cls = (p) => (p >= 66 ? "high" : p >= 33 ? "moderate" : "low");
    const txt = (p) => (p >= 66 ? "Yes" : p >= 33 ? "Maybe" : "No");
</script>

<div class="result">
    <div class="status {cls(probability)}">{txt(probability)}</div>
    <div class="metric">
        <div class="percentage">
            {Math.round(probability)}%
        </div>
        <div class="label">
            Burst Probability
        </div>
    </div>
</div>

<style>
    .result {
        display: flex;
        align-items: center;
        justify-content: space-between;
        padding: 0.5rem 1rem;
        border-radius: 0.5rem;
        background: rgba(12, 30, 33, 0.5);
        border: 1px solid rgba(152, 255, 240, 0.12);
    }

    .status {
        font-size: 1.375rem;
        font-weight: 800;
    }

    .status.low {
        color: #2fd39b;
    }

    .status.moderate {
        color: #ffd166;
    }

    .status.high {
        color: #ff6b6b;
    }

    .metric {
        text-align: right;
    }

    .percentage {
        font-size: 1.75rem;
        font-weight: 900;
        color: #eafff9;
    }

    .label {
        font-size: 0.6875rem;
        color: #a0d2cf;
    }
</style>
