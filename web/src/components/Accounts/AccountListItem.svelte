<script lang="ts">
    import { accounts, activeAccount, popupDetails, atm, translations } from "../../store/stores";
    import { formatMoney } from "../../utils/misc";
    export let account:any;

    function handleAccountClick(id: any) {
        activeAccount.update(() => id);
    };

    let isAtm: boolean;
    function handleButton(id:string, type:string) {
        let account = $accounts.find((accountItem: any) => id === accountItem.id);
        popupDetails.update(() => ({ actionType: type, account }));
    }

    atm.subscribe((usingAtm: boolean) => {
        isAtm = usingAtm;
    });
</script>

<section class="account" class:active={$activeAccount === account.id} on:click={()=>handleAccountClick(account.id)} on:keydown={()=>{}}>
    <div class="account-top"><span class="account-type"><i class="fa-solid fa-credit-card"></i> {account.type}{$translations.account}</span><span class="account-id">#{account.id}</span></div>
    <h5><span>{account.name}</span><i class="fa-solid fa-arrow-up-right-from-square"></i></h5>
    <div class="price"><span>{$translations.balance}</span><strong>{formatMoney(account.amount)}</strong></div>

    <div class="btns-group">
        {#if !account.isFrozen}
            {#if !isAtm}
                <button class="btn btn-green" on:click={() => handleButton(account.id, "deposit")}>{$translations.deposit_but}</button>
            {/if}
            <button class="btn btn-orange" on:click={() => handleButton(account.id, "withdraw")}>{$translations.withdraw_but}</button>
            <button class="btn btn-grey" on:click={() => handleButton(account.id, "transfer")}>{$translations.transfer_but}</button>
        {:else}
            {$translations.frozen}
        {/if}
    </div>
</section>

<style>
    .account { position: relative; overflow: hidden; padding: 1.15rem; margin-bottom: .8rem; border: 1px solid rgba(255,255,255,.08); border-radius: 1rem; cursor: pointer; background: linear-gradient(145deg, rgba(21,42,49,.75), rgba(9,19,24,.9)); transition: transform 180ms ease, border-color 180ms ease, box-shadow 180ms ease; }
    .account::before { content: ""; position: absolute; width: 7rem; height: 7rem; right: -3rem; top: -3rem; border-radius: 50%; border: 1px solid rgba(103,245,255,.2); }
    .account:hover, .account.active { transform: translateX(4px); border-color: rgba(103,245,255,.55); box-shadow: 0 0 25px rgba(103,245,255,.1); }
    .account-top, .account h5, .price { display: flex; align-items: center; justify-content: space-between; }
    .account-type { color: var(--clr-cyan); font-size: .72rem; text-transform: uppercase; letter-spacing: .1em; }
    .account-type i { margin-right: .35rem; }
    .account-id { color: var(--clr-muted); font-size: .7rem; }
    h5 { margin: 1.5rem 0 1.2rem; font: 600 1.05rem "Sora", sans-serif; }
    h5 i { color: var(--clr-muted); font-size: .8rem; }
    .price { align-items: flex-end; margin-bottom: 1rem; flex-direction: column; gap: .25rem; }
    .price span { color: var(--clr-muted); font-size: .68rem; text-transform: uppercase; letter-spacing: .12em; }
    .price strong { font: 700 1.65rem "Sora", sans-serif; color: var(--clr-white); }
    .btns-group > :first-child { grid-column: 1 / -1; }
    .btns-group { display: grid; grid-template-columns: repeat(2, 1fr); gap: .5rem; }
</style>
