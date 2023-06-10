import { useBackend } from '../backend';
import { Window } from '../layouts';

export const StatsBrowser = (props, context) => {
  const { act, data } = useBackend(context);
  return (
    <Window title="StatsBrowser" width={700} height={525}>
      <Window.Content scrollable>
        <div>
          <div class="flex flex-col items-center dt:flex-row dt:items-start dt:justify-around">
            <div class="flex mb-4 dt:flex-col dt:items-center dt:mb-0 items-start">
              <table class="items-center place-content-center">
                <tr>
                  <td>
                    <div class="u-anchor" data-v-843b7e64="">
                      <div class="fss-special-card u-center font-condensed font-bold rounded-xl border-2 border-black text-8xl h-36 w-20 s" data-v-b3f85a52="">
                        <div class="label" data-v-b3f85a52="">S</div>
                      </div>
                    </div>
                  </td>
                  <td>
                    <div class="u-anchor" data-v-843b7e64="">
                      <div class="flex flex-col items-center w-[56px]" data-v-641fc2c1="">
                        <div class="u-action text-4xl leading-none text-white/25 active" data-v-641fc2c1="" data-v-8674d4b1="">
                          <i class="fas fa-angle-up" data-v-641fc2c1="" />
                        </div>
                        <div class="font-condensed font-bold text-5xl leading-none" data-v-641fc2c1="">1</div>
                        <div class="u-action text-4xl leading-none text-white/25 disabled" data-cy="decrease" data-v-641fc2c1="" data-v-8674d4b1="">
                          <i class="fas fa-angle-down" data-v-641fc2c1="" />
                        </div>
                      </div>
                      <div class="right spot" data-v-843b7e64="" />
                    </div>
                  </td>
                </tr>
                <tr>
                  <td colspan="2">
                    <div data-cy="status" class="m-2 col-span-2 h-6 u-center">1 unused pt</div>
                  </td>
                </tr>
              </table>
              <div class="flex flex-col gap-2" data-cy="perks">
                <div class="u-action" data-v-8674d4b1="">
                  <div data-cy="add-perk" class="h-[228px] u-center w-[160px] border-dashed border-2 border-white/50 dt:hover:border-white/75">
                    <div class="font-condensed text-xl text-white/25">Add perk card</div>
                  </div>
                </div>
              </div>
            </div>
            <div class="flex mb-4 dt:flex-col dt:items-center dt:mb-0 items-start" data-cy="special-p">
              <table class="items-center place-content-center">
                <tr>
                  <td>
                    <div class="u-anchor" data-v-843b7e64="">
                      <div class="fss-special-card u-center font-condensed font-bold rounded-xl border-2 border-black text-8xl h-36 w-20 p" data-v-b3f85a52="">
                        <div class="label" data-v-b3f85a52="">P</div>
                      </div>
                    </div>
                  </td>
                  <td>
                    <div class="u-anchor" data-v-843b7e64="">
                      <div class="flex flex-col items-center w-[56px]" data-v-641fc2c1="">
                        <div class="u-action text-4xl leading-none text-white/25 active" data-cy="increase" data-v-641fc2c1="" data-v-8674d4b1="">
                          <i class="fas fa-angle-up" data-v-641fc2c1="" />
                        </div>
                        <div class="font-condensed font-bold text-5xl leading-none" data-cy="value" data-v-641fc2c1="">1</div>
                        <div class="u-action text-4xl leading-none text-white/25 disabled" data-v-641fc2c1="" data-v-8674d4b1="">
                          <i class="fas fa-angle-down" data-v-641fc2c1="" />
                        </div>
                      </div>
                      <div class="right spot" data-v-843b7e64="" />
                    </div>
                  </td>
                </tr>
                <tr>
                  <td colspan="2">
                    <div data-cy="status" class="m-2 col-span-2 h-6 u-center">1 unused pt</div>
                  </td>
                </tr>
              </table>
              <div class="flex flex-col gap-2">
                <div class="u-action" data-v-8674d4b1="">
                  <div data-cy="add-perk" class="h-[228px] u-center w-[160px] border-dashed border-2 border-white/50 dt:hover:border-white/75">
                    <div class="font-condensed text-xl text-white/25">Add perk card</div>
                  </div>
                </div>
              </div>
            </div>
            <div class="flex mb-4 dt:flex-col dt:items-center dt:mb-0 items-start">
              <table class="items-center place-content-center">
                <tr>
                  <td>
                    <div class="fss-special-card u-center font-condensed font-bold rounded-xl border-2 border-black text-8xl h-36 w-20 e" data-v-b3f85a52="">
                      <div class="label" data-v-b3f85a52="">E</div>
                    </div>
                  </td>
                  <td>
                    <div class="u-anchor" data-v-843b7e64="">
                      <div class="flex flex-col items-center w-[56px]" data-v-641fc2c1="">
                        <div class="u-action text-4xl leading-none text-white/25 active" data-v-641fc2c1="" data-v-8674d4b1="">
                          <i class="fas fa-angle-up" data-v-641fc2c1="" />
                        </div>
                        <div class="font-condensed font-bold text-5xl leading-none" data-cy="value" data-v-641fc2c1="">1</div>
                        <div class="u-action text-4xl leading-none text-white/25 disabled" data-v-641fc2c1="" data-v-8674d4b1="">
                          <i class="fas fa-angle-down" data-v-641fc2c1="" />
                        </div>
                      </div>
                      <div class="right spot" data-v-843b7e64="" />
                    </div>
                  </td>
                </tr>
                <tr>
                  <td colspan="2">
                    <div data-cy="status" class="m-2 col-span-2 h-6 u-center">1 unused pt</div>
                  </td>
                </tr>
              </table>
              <div class="flex flex-col gap-2">
                <div class="u-action" data-v-8674d4b1="">
                  <div data-cy="add-perk" class="h-[228px] u-center w-[160px] border-dashed border-2 border-white/50 dt:hover:border-white/75">
                    <div class="font-condensed text-xl text-white/25">Add perk card</div>
                  </div>
                </div>
              </div>
            </div>
            <div class="flex mb-4 dt:flex-col dt:items-center dt:mb-0 items-start" data-cy="special-c">
              <table class="items-center place-content-center">
                <tr>
                  <td>
                    <div class="u-anchor" data-v-843b7e64="">
                      <div class="fss-special-card u-center font-condensed font-bold rounded-xl border-2 border-black text-8xl h-36 w-20 c" data-v-b3f85a52="">
                        <div class="label" data-v-b3f85a52="">C</div>
                      </div>
                    </div>
                  </td>
                  <td>
                    <div class="u-anchor" data-v-843b7e64="">
                      <div class="flex flex-col items-center w-[56px]" data-v-641fc2c1="">
                        <div class="u-action text-4xl leading-none text-white/25 active" data-cy="increase" data-v-641fc2c1="" data-v-8674d4b1="">
                          <i class="fas fa-angle-up" data-v-641fc2c1="" />
                        </div>
                        <div class="font-condensed font-bold text-5xl leading-none" data-cy="value" data-v-641fc2c1="">1</div>
                        <div class="u-action text-4xl leading-none text-white/25 disabled" data-cy="decrease" data-v-641fc2c1="" data-v-8674d4b1="">
                          <i class="fas fa-angle-down" data-v-641fc2c1="" />
                        </div>
                      </div>
                      <div class="right spot" data-v-843b7e64="" />
                    </div>
                  </td>
                </tr>
                <tr>
                  <td colspan="2">
                    <div data-cy="status" class="m-2 col-span-2 h-6 u-center">1 unused pt</div>
                  </td>
                </tr>
              </table>
              <div class="flex flex-col gap-2" data-cy="perks">
                <div class="u-action" data-v-8674d4b1="">
                  <div data-cy="add-perk" class="h-[228px] u-center w-[160px] border-dashed border-2 border-white/50 dt:hover:border-white/75">
                    <div class="font-condensed text-xl text-white/25">Add perk card</div>
                  </div>
                </div>
              </div>
            </div>
            <div class="flex mb-4 dt:flex-col dt:items-center dt:mb-0 items-start" data-cy="special-i">
              <table class="items-center place-content-center">
                <tr>
                  <td>
                    <div class="u-anchor" data-v-843b7e64="">
                      <div class="fss-special-card u-center font-condensed font-bold rounded-xl border-2 border-black text-8xl h-36 w-20 i" data-v-b3f85a52="">
                        <div class="label" data-v-b3f85a52="">I</div>
                      </div>
                    </div>
                  </td>
                  <td>
                    <div class="u-anchor" data-v-843b7e64="">
                      <div class="flex flex-col items-center w-[56px]" data-v-641fc2c1="">
                        <div class="u-action text-4xl leading-none text-white/25 active" data-v-641fc2c1="" data-v-8674d4b1="">
                          <i class="fas fa-angle-up" data-v-641fc2c1="" />
                        </div>
                        <div class="font-condensed font-bold text-5xl leading-none" data-v-641fc2c1="">1</div>
                        <div class="u-action text-4xl leading-none text-white/25 disabled" data-v-641fc2c1="" data-v-8674d4b1="">
                          <i class="fas fa-angle-down" data-v-641fc2c1="" />
                        </div>
                      </div>
                      <div class="right spot" data-v-843b7e64="" />
                    </div>
                  </td>
                </tr>
                <tr>
                  <td colspan="2">
                    <div data-cy="status" class="m-2 col-span-2 h-6 u-center">1 unused pt</div>
                  </td>
                </tr>
              </table>
              <div class="flex flex-col gap-2" data-cy="perks">
                <div class="u-action" data-v-8674d4b1="">
                  <div data-cy="add-perk" class="h-[228px] u-center w-[160px] border-dashed border-2 border-white/50 dt:hover:border-white/75">
                    <div class="font-condensed text-xl text-white/25">Add perk card</div>
                  </div>
                </div>
              </div>
            </div>
            <div class="flex mb-4 dt:flex-col dt:items-center dt:mb-0 items-start">
              <table class="items-center place-content-center">
                <tr>
                  <td>
                    <div class="u-anchor" data-v-843b7e64="">
                      <div class="fss-special-card u-center font-condensed font-bold rounded-xl border-2 border-black text-8xl h-36 w-20 a" title="Agility" data-v-b3f85a52="">
                        <div class="label" data-v-b3f85a52="">A</div>
                      </div>
                    </div>
                  </td>
                  <td>
                    <div class="u-anchor" data-v-843b7e64="">
                      <div class="flex flex-col items-center w-[56px]" data-v-641fc2c1="">
                        <div class="u-action text-4xl leading-none text-white/25 active" data-cy="increase" data-v-641fc2c1="" data-v-8674d4b1="">
                          <i class="fas fa-angle-up" data-v-641fc2c1="" />
                        </div>
                        <div class="font-condensed font-bold text-5xl leading-none" data-cy="value" data-v-641fc2c1="">1</div>
                        <div class="u-action text-4xl leading-none text-white/25 disabled" data-cy="decrease" data-v-641fc2c1="" data-v-8674d4b1="">
                          <i class="fas fa-angle-down" data-v-641fc2c1="" />
                        </div>
                      </div>
                      <div class="right spot" data-v-843b7e64="" />
                    </div>
                  </td>
                </tr>
                <tr>
                  <td colspan="2">
                    <div data-cy="status" class="m-2 col-span-2 h-6 u-center">1 unused pt</div>
                  </td>
                </tr>
              </table>
              <div class="flex flex-col gap-2" data-cy="perks">
                <div class="u-action" data-v-8674d4b1="">
                  <div data-cy="add-perk" class="h-[228px] u-center w-[160px] border-dashed border-2 border-white/50 dt:hover:border-white/75">
                    <div class="font-condensed text-xl text-white/25">Add perk card</div>
                  </div>
                </div>
              </div>
            </div>
            <div class="flex mb-4 dt:flex-col dt:items-center dt:mb-0 items-start" data-cy="special-l">
              <table class="items-center place-content-center">
                <tr>
                  <td>
                    <div class="u-anchor" data-v-843b7e64="">
                      <div class="fss-special-card u-center font-condensed font-bold rounded-xl border-2 border-black text-8xl h-36 w-20 l" title="Luck" data-v-b3f85a52="">
                        <div class="label" data-v-b3f85a52="">L</div>
                      </div>
                    </div>
                  </td>
                  <td>
                    <div class="u-anchor" data-v-843b7e64="">
                      <div class="flex flex-col items-center w-[56px]" data-v-641fc2c1="">
                        <div class="u-action text-4xl leading-none text-white/25 active" data-v-641fc2c1="" data-v-8674d4b1="">
                          <i class="fas fa-angle-up" data-v-641fc2c1="" />
                        </div>
                        <div class="font-condensed font-bold text-5xl leading-none" data-v-641fc2c1="">1</div>
                        <div class="u-action text-4xl leading-none text-white/25 disabled" data-v-641fc2c1="" data-v-8674d4b1="">
                          <i class="fas fa-angle-down" data-v-641fc2c1="" />
                        </div>
                      </div>
                      <div class="right spot" data-v-843b7e64="" />
                    </div>
                  </td>
                </tr>
                <tr>
                  <td colspan="2">
                    <div data-cy="status" class="m-2 col-span-2 h-6 u-center">1 unused pt</div>
                  </td>
                </tr>
              </table>
              <div class="flex flex-col gap-2">
                <div class="u-action" data-v-8674d4b1="">
                  <div data-cy="add-perk" class="h-[228px] u-center w-[160px] border-dashed border-2 border-white/50 dt:hover:border-white/75">
                    <div class="font-condensed text-xl text-white/25">Add perk card</div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div data-v-7da27d2b="" class="u-mobile-anchored" data-cy="perk-pool">
          <div>
            <div data-v-232502f6="" class="fss-character-space-toolbar grid items-center py-4 grid-cols-[32px_1fr_32px]">
              <div data-v-232502f6="" />
              <div data-v-232502f6="">
                <div class="flex gap-2 justify-center flex-wrap">
                  <div data-v-8674d4b1="" class="u-action font-condensed uppercase px-2 font-bold u-button bg-white text-black">All by level</div>
                  <div data-v-8674d4b1="" class="u-action font-condensed uppercase px-2 font-bold u-button dt:hover:bg-white/25">Weapons</div>
                  <div data-v-8674d4b1="" class="u-action font-condensed uppercase px-2 font-bold u-button dt:hover:bg-white/25">Armor </div>
                  <div data-v-8674d4b1="" class="u-action font-condensed uppercase px-2 font-bold u-button dt:hover:bg-white/25">Consumables</div>
                  <div data-v-8674d4b1="" class="u-action font-condensed uppercase px-2 font-bold u-button dt:hover:bg-white/25">Resistances</div>
                  <div data-v-8674d4b1="" class="u-action font-condensed uppercase px-2 font-bold u-button dt:hover:bg-white/25">Weight</div>
                </div>
              </div>
              <div data-v-8674d4b1="" data-v-232502f6="" class="u-action u-button text-xl dt:hover:text-white/75" data-cy="close">
                <i data-v-232502f6="" class="fas fa-times" />
              </div>
            </div>
            <div data-v-7614e9e1="" class="u-mobile-slider">
              <div class="flex gap-4 p-4 dt:flex-wrap dt:justify-center">
                <div data-v-8674d4b1="" class="u-action u-transition dt:hover:scale-105" data-cy="perk">
                  <div data-v-fac1b534="" class="card s damage" data-cy="card">
                    <div data-v-fac1b534="" class="header -ml-1 s">
                      <div data-v-fac1b534="" class="font-condensed font-bold text-xl rounded border-2 text-black bg-white w-8 h-8 u-center">
                        <span data-v-fac1b534="">1</span>
                      </div>
                      <div data-v-d44c1d41="" data-v-fac1b534="" class="u-adaptive-font title" style="font-size: 18px;">Gladiator</div>
                    </div>
                    <div data-v-d44c1d41="" data-v-fac1b534="" class="u-adaptive-font leading-tight p-2 text-center" style="font-size: 18px;">Your one-handed melee weapons now do +10% damage.</div>
                    <div data-v-fac1b534="" class="ranks">
                      <div data-v-127279da="" data-v-fac1b534="" class="fss-perk-rank-selector content">
                        <div data-v-8674d4b1="" data-v-127279da="" class="u-action rank active text-white drop-shadow" data-cy="perk-rank">
                          <i data-v-127279da="" class="fas fa-star" />
                        </div>
                        <div data-v-8674d4b1="" data-v-127279da="" class="u-action rank" data-cy="perk-rank">
                          <i data-v-127279da="" class="fas fa-star" />
                        </div>
                        <div data-v-8674d4b1="" data-v-127279da="" class="u-action rank" data-cy="perk-rank">
                          <i data-v-127279da="" class="fas fa-star" />
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </Window.Content>
    </Window>
  );
};
