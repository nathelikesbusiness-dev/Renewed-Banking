<script lang="ts">
    export let transaction: any;
    import { formatMoney } from "../../utils/misc";
    import { translations } from "../../store/stores";
    function getTimeElapsed(seconds: number): string {
        let retData: string;
        const timestamp = Math.floor(Date.now() / 1000)-seconds;
        const minutes = Math.floor(timestamp / 60);
        const hours = Math.floor(minutes / 60);
        const days = Math.floor(hours / 24);
        const weeks = Math.floor(days / 7);

        if (weeks !== 0 && weeks > 1) {
            retData = $translations.weeks.replace("%s", weeks);
        } else if (weeks !== 0 && weeks === 1) {
            retData = $translations.aweek;
        } else if (days !== 0 && days > 1) {
            retData = $translations.days.replace("%s", days);
        } else if (days !== 0 && days === 1) {
            retData = $translations.aday;
        } else if (hours !== 0 && hours > 1) {
            retData = $translations.hours.replace("%s", hours);
        } else if (hours !== 0 && hours === 1) {
            retData = $translations.ahour;
        } else if (minutes !== 0 && minutes > 1) {
            retData = $translations.mins.replace("%s", minutes);
        } else if (minutes !== 0 && minutes === 1) {
            retData = $translations.amin;
        } else {
            retData = $translations.secs;
        }
        return retData;
    }
</script>

<section class="transaction">
    <h5>
        <span class="title-container" class:withdrawTitle={transaction.trans_type === "withdraw"}>
            <span class="transaction-icon"><i class="fa-solid" class:fa-arrow-down={transaction.trans_type === "withdraw"} class:fa-arrow-up={transaction.trans_type !== "withdraw"}></i></span><span>{transaction.title}</span><p>{transaction.trans_type.toUpperCase()}</p>
        </span>
        <span class="trans_id" class:withdrawId={transaction.trans_type === "withdraw"}>{transaction.trans_id}</span>
    </h5>
    <h4>
        <div style="display: flex; flex-direction: column; justify-content: flex-start; align-items: flex-start;">
            <span class:withdraw={transaction.trans_type === "withdraw"}>
                <i class="fa-solid fa-money-bill"></i>
                {formatMoney(transaction.amount)}
            </span>
        </div>
        <span> {transaction.receiver} </span>
        <span>{getTimeElapsed(transaction.time)} <br /> {transaction.issuer}</span>
    </h4>

    <h6>
        {$translations.message} <br />
        {transaction.message}
    </h6>
</section>

<style>
    .transaction { padding: 1.15rem 1.3rem; margin-bottom: .7rem; border: 1px solid rgba(255,255,255,.07); border-radius: 1rem; background: rgba(17,35,41,.7); box-shadow: 0 1rem 2rem rgba(0,0,0,.13); animation: row-in 350ms ease both; }
    .transaction:hover { border-color: rgba(103,245,255,.35); background: rgba(20,43,50,.82); }
    .title-container { display: flex; align-items: center; gap: .6rem; }
    .transaction-icon { display: grid; place-items: center; width: 2rem; height: 2rem; border-radius: .6rem; color: #05282b; background: var(--clr-teal); }
    .withdrawTitle .transaction-icon { color: #ffb4c1; background: rgba(255,120,145,.2); }
    .title-container > p { padding: .3rem .5rem; border-radius: .35rem; color: var(--clr-teal); background: rgba(31,199,189,.1); font-size: .57rem; letter-spacing: .1em; }
    .withdrawTitle > p { color: #ff9db0; background: rgba(255,120,145,.1); }
    .trans_id { color: var(--clr-muted); font-size: .62rem; letter-spacing: .04em; }
    .transaction h5 { display: flex; align-items: center; justify-content: space-between; padding-bottom: .8rem; margin-bottom: 1rem; border-bottom: 1px solid var(--clr-line); font-size: .9rem; }
    .transaction h4 { display: flex; justify-content: space-between; align-items: flex-start; gap: 1rem; margin-bottom: 1.1rem; font-size: .76rem; color: var(--clr-muted); }
    .transaction h4 span:first-child { color: var(--clr-cyan); font: 600 1rem "Sora", sans-serif; }
    .transaction h4 span.withdraw { color: #ff9db0; }
    .transaction h4 span:nth-child(2) { color: var(--clr-white); }
    .transaction h6 { margin: 0; color: var(--clr-muted); font-size: .72rem; font-weight: 400; }
    @keyframes row-in { from { opacity: 0; transform: translateX(.5rem); } to { opacity: 1; transform: translateX(0); } }
</style>
