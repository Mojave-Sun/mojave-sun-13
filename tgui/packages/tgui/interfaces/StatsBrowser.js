import { useBackend, useSharedState } from '../backend';
import { classes } from 'common/react';
import { Window } from '../layouts';
import { Button, Tabs } from '../components';

export const StatsBrowser = (props, context) => {
  const { act, data } = useBackend(context);
  const [selectedStat, setSelectedStat] = useSharedState(context, 'selectedStat', "none");
  const [tabFilter, setTabFilter] = useSharedState(context, 'tabFilter', "allbylevel");
  const perks = data.perks || [];
  return (
    <Window title="StatsBrowser" width={1200} height={800}>
      <Window.Content scrollable>
        <div>
          <div class="flex flex-col items-center dt:flex-row dt:items-start dt:justify-around">
            <Stat name="P" styleclass="p" level="5" freepoint="1" selectStat={() => { setSelectedStat("p"); }} />
            <Stat name="E" styleclass="e" level="5" freepoint="1" selectStat={() => { setSelectedStat("e"); }} />
            <Stat name="R" styleclass="r" level="5" freepoint="1" selectStat={() => { setSelectedStat("r"); }} />
            <Stat name="S" styleclass="s" level="5" freepoint="1" selectStat={() => { setSelectedStat("s"); }} />
            <Stat name="O" styleclass="o" level="5" freepoint="1" selectStat={() => { setSelectedStat("o"); }} />
            <Stat name="N" styleclass="n" level="5" freepoint="1" selectStat={() => { setSelectedStat("n"); }} />
          </div>
          { selectedStat !== "none" && tabFilter && (
            <div class="u-mobile-anchored">
              <div>
                <div data-v-232502f6="" class="fss-character-space-toolbar items-center py-4">
                  <div data-v-232502f6="">
                    <div class="flex gap-2 justify-center flex-wrap">
                      <Tabs className="uppercase px-2 font-bold Tab--custom">
                        <Tabs.Tab key="allbylevel" selected={tabFilter === "allbylevel"} onClick={() => setTabFilter("allbylevel")}>All by level</Tabs.Tab>
                        <Tabs.Tab key="weapons" selected={tabFilter === "weapons"} onClick={() => setTabFilter("weapons")}>Weapons</Tabs.Tab>
                        <Tabs.Tab key="armor" selected={tabFilter === "armor"} onClick={() => setTabFilter("armor")}>Armor</Tabs.Tab>
                        <Tabs.Tab key="consumables" selected={tabFilter === "consumables"} onClick={() => setTabFilter("consumables")}>Consumables</Tabs.Tab>
                        <Tabs.Tab key="resistances" selected={tabFilter === "resistances"} onClick={() => setTabFilter("resistances")}>Resistances</Tabs.Tab>
                        <Tabs.Tab key="weight" selected={tabFilter === "weight"} onClick={() => setTabFilter("weight")}>Weight</Tabs.Tab>
                      </Tabs>
                      <Button color="rgba(0, 0, 0, 0)" className="text-xl absolute right-2"
                        onClick={() => {
                          setSelectedStat("none");
                        }}>
                        <i class="fas fa-times" />
                      </Button>
                    </div>
                  </div>
                </div>
                <div data-v-7614e9e1="" class="u-mobile-slider">
                  <div class="flex p-4 flex-wrap dt:justify-center">
                    {perks.map(perk => perk.type === selectedStat && (perk.filter === tabFilter || tabFilter === "allbylevel") && (
                      <Perk
                        key={perk.id}
                        perk={perk}
                        addperk={() => act('add_perk', {
                          id: perk.id,
                        })} />
                    ))}
                  </div>
                </div>
              </div>
            </div>
          )}
        </div>
      </Window.Content>
    </Window>
  );
};

const Stat = (props, context) => {
  const { act, data } = useBackend(context);
  const {
    name,
    styleclass,
    level,
    freepoint,
    selectStat,
  } = props;
  const [filteredPerks, setFilteredPerks] = useLocalState(
    context,
    `selectedQuirks_${styleclass}`,
    data.activeperks?.filter(perk => perk.type === styleclass)
    || []);
  const [selectedperk, setSelectedPerk] = useSharedState(context, 'selectedPerk', 'none');
  return (
    <div class="flex mb-4 dt:flex-col dt:items-center dt:mb-0 items-start gap-4">
      <table class="items-center place-content-center">
        <tr>
          <td>
            <div class="u-anchor" data-v-843b7e64="">
              <div className={classes(["fss-special-card", "u-center", "font-condensed", "font-bold", "rounded-xl", "border-2", "border-black", "text-8xl", "h-36", "w-20", styleclass])} data-v-b3f85a52="">
                <div class="label" data-v-b3f85a52="">{name}</div>
              </div>
            </div>
          </td>
          <td>
            <div class="u-anchor" data-v-843b7e64="">
              <div class="flex flex-col items-center w-[56px]" data-v-641fc2c1="">
                <div class="u-action text-4xl leading-none text-white/25 active" data-v-641fc2c1="">
                  <i class="fas fa-angle-up" data-v-641fc2c1="" />
                </div>
                <div class="font-condensed font-bold text-5xl leading-none" data-v-641fc2c1="">{level}</div>
                <div class="u-action text-4xl leading-none text-white/25 disabled" data-v-641fc2c1="">
                  <i class="fas fa-angle-down" data-v-641fc2c1="" />
                </div>
              </div>
              <div class="right spot" data-v-843b7e64="" />
            </div>
          </td>
        </tr>
        <tr>
          <td colspan="2">
            <div class="m-2 col-span-2 h-6 u-center">{freepoint} unused pt</div>
          </td>
        </tr>
      </table>
      <div class="flex flex-col">
        {filteredperks.length !== 0 && (
          <div class="u-stack extra-padding gap-2">
            {filteredPerks.map(perk => (
              <PerkActive key={perk.name} perk={perk}
                last={filteredperks[filteredperks.length - 1] === perk}
                below={selectedperk !== perk.name && selectedperk !== "none"}
                remove_perk={() => { act('remove_perk', {
                  id: perk.id,
                }); }}
                perkactiveclick={() => {
                  if (selectedperk === perk.name) {
                    setSelectedPerk("none");
                  }
                  else {
                    setSelectedPerk(perk.name);
                  }
                }} />
            ))}
          </div>
        )}
        <Button color="rgba(0, 0, 0, 0)"
          onClick={selectStat}
          className={classes(["u-center w-[160px]", "border-dashed", "border-2", "border-white/50", "hover:border-white/75", "addperk", "gap-2",
            filteredPerks.length === 0 && "h-[228px]",
            filteredPerks.length !== 0 && "h-[28px]"])}>
          { filteredPerks.length === 0 && (
            "Add perk card"
          )}
          { filteredPerks.length !== 0 && (
            <i class="fas fa-plus text-white/25" />
          )}
        </Button>
      </div>
    </div>
  );
};

const PerkActive = props => {
  const {
    perk,
    perkactiveclick,
    remove_perk,
    last,
    below,
  } = props;
  const {
    name,
    type,
    desc,
    level,
    ranks,
  } = perk;
  return (
    <div onClick={perkactiveclick} className="u-stack-item">
      <div className={classes(["container", last && "last", below && "below"])} style="z-index: 10;">
        <div>
          <div data-v-6b1720e3="" class="u-removable">
            <div>
              <Button color="rgba(0,0,0,0)" onClick={remove_perk} className="u-button remove">
                <i class="fas fa-times" />
              </Button>
            </div>
            <div data-v-fac1b534="" class="card damage">
              <div data-v-fac1b534="" className={classes(["header", "-ml-1", type])}>
                <div data-v-fac1b534="" class="font-condensed font-bold text-xl rounded border-2 text-black bg-white w-8 h-8 u-center">
                  <span data-v-fac1b534="">{level}</span>
                </div>
                <div data-v-d44c1d41="" data-v-fac1b534="" class="u-adaptive-font title" style="font-size: 18px;">{name}</div>
              </div>
              <div data-v-d44c1d41="" data-v-fac1b534="" class="u-adaptive-font leading-tight p-2 text-center" style="font-size: 18px;">{desc}</div>
              <div data-v-fac1b534="" class="ranks">
                <div data-v-127279da="" data-v-fac1b534="" className={classes(["fss-perk-rank-selector", "content", type])}>
                  <div data-v-8674d4b1="" data-v-127279da="" class="rank active text-white drop-shadow">
                    <i data-v-127279da="" class="fas fa-star" />
                  </div>
                  <div data-v-8674d4b1="" data-v-127279da="" class="rank">
                    <i data-v-127279da="" class="fas fa-star" />
                  </div>
                  <div data-v-8674d4b1="" data-v-127279da="" class="rank">
                    <i data-v-127279da="" class="fas fa-star" />
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};

const Perk = props => {
  const {
    perk,
    addperk,
  } = props;
  const {
    name,
    type,
    desc,
    level,
    ranks,
  } = perk;
  return (
    <Button onClick={addperk} color="rgba(0, 0, 0, 0)" data-v-8674d4b1="" class="u-transition dt:hover:scale-105 gap-4">
      <div data-v-fac1b534="" class="card damage">
        <div data-v-fac1b534="" className={classes(["header", "-ml-1", type])}>
          <div data-v-fac1b534="" class="font-condensed font-bold text-xl rounded border-2 text-black bg-white w-8 h-8 u-center">
            <span data-v-fac1b534="">{level}</span>
          </div>
          <div data-v-d44c1d41="" data-v-fac1b534="" class="u-adaptive-font title" style="font-size: 18px;">{name}</div>
        </div>
        <div data-v-d44c1d41="" data-v-fac1b534="" class="u-adaptive-font leading-tight p-2 text-center" style="font-size: 18px;">{desc}</div>
        <div data-v-fac1b534="" class="ranks">
          <div data-v-127279da="" data-v-fac1b534="" className={classes(["fss-perk-rank-selector", "content", type])}>
            <div data-v-8674d4b1="" data-v-127279da="" class=" rank active text-white drop-shadow">
              <i data-v-127279da="" class="fas fa-star" />
            </div>
            <div data-v-8674d4b1="" data-v-127279da="" class="rank">
              <i data-v-127279da="" class="fas fa-star" />
            </div>
            <div data-v-8674d4b1="" data-v-127279da="" class="rank">
              <i data-v-127279da="" class="fas fa-star" />
            </div>
          </div>
        </div>
      </div>
    </Button>
  );
};
