<script lang="ts">
    import { accounts, activeAccount, popupDetails, loading, translations } from "../store/stores";
    import {fetchNui} from "../utils/fetchNui"
    let amount: number = 0;
    let comment: string = "";
    let stateid: string = "";
    $: account = $accounts.find((accountItem: any) => $activeAccount === accountItem.id);

    function closePopup() {
        popupDetails.update((val: any) => ({
            ...val,
            actionType: ""
        }));
    }

    function submitInput() {
        loading.set(true);
        fetchNui($popupDetails.actionType, {fromAccount: $popupDetails.account.id, amount: amount, comment: comment, stateid: stateid}).then(retData => {
            setTimeout(() => {
                if (retData !== false){
                    accounts.set(retData);
                }
                loading.set(false);
            }, 1000);
        })
        closePopup();
    }
</script>

<section class="popup-container">
    <section class="popup-content">
        <div class="popup-glow"></div>
        <header><span class="modal-icon"><i class="fa-solid fa-arrow-right-arrow-left"></i></span><div><span class="eyebrow">SECURE TRANSACTION</span><h2>{$popupDetails.account.type}{$translations.account}/ {$popupDetails.account.id}</h2></div><button class="close-button" type="button" on:click={closePopup}><i class="fa-solid fa-xmark"></i></button></header>
        <form action="#">
            <div class="form-row">
                <label for="amount">{$translations.amount}</label>
                <input bind:value={amount} type="number" name="amount" id="amount" placeholder="$" />
            </div>

            <div class="form-row">
                <label for="comment">{$translations.comment}</label>
                <input bind:value={comment} type="text" name="comment" id="comment" placeholder="//" />
            </div>

            {#if $popupDetails.actionType === "transfer"}
                <div class="form-row">
                    <label for="stateId">{$translations.transfer}</label>
                    <input bind:value={stateid} type="text" name="stateId" id="stateId" placeholder="#" />
                </div>
            {/if}

            <div class="btns-group">
                <button type="button" class="btn btn-orange" on:click={closePopup}>{$translations.cancel}</button>
                <button type="button" class="btn btn-green" on:click={() => submitInput()}>{$translations.confirm}</button>
            </div>
        </form>
    </section>
</section>

<style>
    .popup-container { position: fixed; inset: 0; z-index: 5; display: flex; align-items: center; justify-content: center; background: rgba(1,8,10,.78); animation: modal-in 220ms ease both; }
    .popup-content { position: relative; overflow: hidden; max-width: 42rem; width: calc(100% - 2rem); background: linear-gradient(145deg, #10272e, #071317); padding: 2rem; border: 1px solid rgba(103,245,255,.3); border-radius: 1.2rem; box-shadow: 0 2rem 6rem rgba(0,0,0,.6), 0 0 2rem rgba(103,245,255,.08); }
    .popup-glow { position: absolute; width: 14rem; height: 14rem; top: -8rem; right: -4rem; border-radius: 50%; background: var(--clr-cyan); filter: blur(70px); opacity: .12; }
    header { position: relative; display: flex; align-items: center; gap: .8rem; margin-bottom: 2rem; }
    .modal-icon { display: grid; place-items: center; width: 2.8rem; height: 2.8rem; border-radius: .8rem; color: #04282b; background: var(--clr-cyan); }
    .eyebrow { color: var(--clr-cyan); font-size: .63rem; letter-spacing: .15em; }
    h2 { margin: .4rem 0 0; font: 600 1.2rem "Sora", sans-serif; }
    .close-button { margin-left: auto; padding: .6rem; border: 0; color: var(--clr-muted); background: transparent; }
    .close-button:hover { color: var(--clr-white); }

    .form-row { display: flex; flex-direction: column; gap: .55rem; color: var(--clr-muted); margin-bottom: 1.2rem; }
    .form-row label { font-size: .72rem; text-transform: uppercase; letter-spacing: .1em; }
    .form-row input { width: 100%; border: 1px solid rgba(255,255,255,.1); border-radius: .65rem; padding: 1rem; outline: 0; background: rgba(0,0,0,.2); color: var(--clr-white); transition: border-color 180ms ease, box-shadow 180ms ease; }
    .form-row input:focus { border-color: var(--clr-cyan); box-shadow: 0 0 0 3px rgba(103,245,255,.1); }
    .btns-group { display: grid; grid-template-columns: 1fr 1fr; gap: .7rem; margin-top: 1.7rem; }
    @keyframes modal-in { from { opacity: 0; } to { opacity: 1; } }
</style>
