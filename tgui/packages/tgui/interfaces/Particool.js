import { map } from 'common/collections';
import { toFixed } from 'common/math';
import { numberOfDecimalDigits } from '../../common/math';
import { useBackend, useLocalState } from '../backend';
import { Box, Button, Collapsible, ColorBox, Dropdown, Input, LabeledList, NoticeBox, NumberInput, Section } from '../components';
import { Window } from '../layouts';


const ParticleIntegerEntry = (props, context) => {
  const { value, name } = props;
  const { act } = useBackend(context);
  return (
    <NumberInput
      value={value}
      minValue={-500}
      maxValue={500}
      stepPixelSize={5}
      width="39px"
      onDrag={(e, value) => act('modify_particle_value', {
        new_data: {
          name: name,
          value: value,
          type: 'integer',
        },
      })} />
  );
};

const ParticleFloatEntry = (props, context) => {
  const { value, name } = props;
  const { act } = useBackend(context);
  const [step, setStep] = useLocalState(context, 'particleFloatStep', 0.01);
  return (
    <>
      <NumberInput
        value={value}
        minValue={-500}
        maxValue={500}
        stepPixelSize={4}
        step={step}
        format={value => toFixed(value, numberOfDecimalDigits(step))}
        width="80px"
        onDrag={(e, value) => act('transition_particle_value', {
          new_data: {
            name: name,
            value: value,
            type: 'float',
          },
        })} />
      <Box
        inline
        ml={2}
        mr={1}>
        Step:
      </Box>
      <NumberInput
        value={step}
        step={0.001}
        format={value => toFixed(value, 4)}
        width="70px"
        onChange={(e, value) => setStep(value)} />
    </>
  );
};

const ParticleTextEntry = (props, context) => {
  const { value, name } = props;
  const { act } = useBackend(context);

  return (
    <Input
      value={value}
      width="250px"
      onInput={(e, value) => act('modify_particle_value', {
        new_data: {
          name: name,
          value: value,
          type: 'text',
        },
      })} />
  );
};

const ParticleColorEntry = (props, context) => {
  const { value, name } = props;
  const { act } = useBackend(context);
  return (
    <>
      <Button
        icon="pencil-alt"
        onClick={() => act('modify_color_value')} />
      <ColorBox
        color={value}
        mr={0.5} />
      <Input
        value={value}
        width="90px"
        onInput={(e, value) => act('transition_particle_value', {
          new_data: {
            name: name,
            value: value,
            type: 'color',
          },
        })} />
    </>
  );
};

const ParticleIconEntry = (props, context) => {
  const { value } = props;
  const { act } = useBackend(context);
  return (
    <>
      <Button
        icon="pencil-alt"
        onClick={() => act('modify_icon_value')} />
      <Box inline ml={1}>
        {value}
      </Box>
    </>
  );
};


const particleEntryMap = {

  width: 'float',
  height: 'float',
  count: 'int',
  spawning: 'float',
  bound1: 'string', // 'vector',
  bound2: 'string', // 'vector',
  gravity: 'string', // 'vector',
  gradient: 'string',
  transform: 'matrix',


  lifespan: 'float',
  fade: 'float',
  icon: 'icon',
  icon_state: 'string',
  color: 'color',
  color_change: 'float',
  position: 'string', // 'generator',
  velocity: 'string', // 'generator',
  scale: 'string', // 'generator',
  grow: 'string', // 'generator',
  rotation: 'float',
  spin: 'float',
  friction: 'float',
  drift: 'string', // 'generator',
};

const ParticleDataEntry = (props, context) => {
  const { name, value } = props;

  const particleEntryTypes = {
    int: <ParticleIntegerEntry {...props} />,
    float: <ParticleFloatEntry {...props} />,
    string: <ParticleTextEntry {...props} />,
    color: <ParticleColorEntry {...props} />,
    icon: <ParticleIconEntry {...props} />,
  };

  return (
    <LabeledList.Item label={name}>
      {particleEntryTypes[particleEntryMap[name]] || "Not Found (This is an error)"}
    </LabeledList.Item>
  );
};

const ParticleEntry = (props, context) => {
  const { act, data } = useBackend(context);
  const { name, particleDataEntry } = props;
  const { ...restOfProps } = particleDataEntry;

  return (
    <Collapsible
      title={name}
      buttons={(
        <Button.Confirm
          icon="minus"
          onClick={() => act("remove_particle", { name: name })} />
      )}>
      <Section level={2}>
        <LabeledList>
          {Object.keys(particleEntryMap).map(entryName => {
            const value = restOfProps[entryName];
            return (
              <ParticleDataEntry
                key={entryName}
                name={entryName}
                value={value} />
            );
          })}
        </LabeledList>
      </Section>
    </Collapsible>
  );
};

export const Particool = (props, context) => {
  const { act, data } = useBackend(context);
  const particles = data.target_particle || {};
  const hasParticles = particles !== {};
  const [massApplyPath, setMassApplyPath] = useLocalState(context, 'massApplyPath', '');
  const [hiddenSecret, setHiddenSecret] = useLocalState(context, 'hidden', false);
  return (
    <Window
      title="Particool"
      width={500}
      height={500}>
      <Window.Content scrollable>
        <NoticeBox danger>
          DONT GO BREAKING MY HEART
        </NoticeBox>
        <Section
          title={hiddenSecret ? (
            <>
              <Box mr={0.5} inline>
                MASS EDIT:
              </Box>
              <Input
                value={massApplyPath}
                width="100px"
                onInput={(e, value) => setMassApplyPath(value)} />
              <Button.Confirm
                content="Apply"
                confirmContent="ARE YOU SURE?"
                onClick={() => act('mass_apply', { path: massApplyPath })} />
            </>
          ) : (
            <Box
              inline
              onDblClick={() => setHiddenSecret(true)}>
              Particle
            </Box>
          )}
          buttons={hasParticle ? (
            <Button
              icon="plus"
              content="Add Particle"
              onClick={() => act('add_particle')} />
          ) : {}} >
          {!hasParticles ? (
            <Box>
              No particle
            </Box>
          ) : (
            map((entry, key) => (
              <ParticleEntry particleDataEntry={entry} key={key} />
            ))(particles)
          )}
        </Section>
      </Window.Content>
    </Window>
  );
};
