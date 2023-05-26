import { useBackend } from '../backend';
import { Section, Stack, BlockQuote } from '../components';
import { Window } from '../layouts';

type Info = {
  title: string;
  description: string;
  supervisors: string;
  forbid: string;
  enforce: string;
};

export const JobInfo = (props, context) => {
  const { data } = useBackend<Info>(context);
  const {
    title,
    description,
  } = data;
  return (
    <Window
      width={620}
      height={350}
      title={title}
      theme="mojavesun"
    >
      <Window.Content>
        <Stack fill>
          <Stack.Item width="65%">
            <DescSection />
          </Stack.Item>
          <Stack.Item width="35%">
            <GuidelinesSection />
          </Stack.Item>
        </Stack>
      </Window.Content>
    </Window>
  );
};

const DescSection = (props, context) => {
  const { data } = useBackend<Info>(context);
  const {
    description,
    supervisors,
  } = data;
  return (
    <Stack vertical fill>
      <Stack.Item grow>
        <Section fill scrollable title="Description">
          {description ? description : "Nothingburger."}
        </Section>
      </Stack.Item>
      <Stack.Item>
        <Section title="Supervisors">
          {supervisors ? supervisors : "No gods, no masters."}
        </Section>
      </Stack.Item>
    </Stack>
  );
};

const directivesstyle = {
  fontWeight: 'bold',
  color: '#90EE90',
};

const restrictionsstyle = {
  fontWeight: 'bold',
  color: '#FFCCCB',
};

const GuidelinesSection = (props, context) => {
  const { data } = useBackend<Info>(context);
  const {
    enforce,
    forbid,
  } = data;
  return (
    <Section
      fill
      scrollable
      title="Guidelines"
    >
      <Stack vertical fill>
        <Stack.Item grow>
          <Stack vertical>
            <Stack.Item>
              <span style={directivesstyle}>
                Directives:<br />
              </span>
              <BlockQuote>
                {enforce ? enforce : "None!"}
              </BlockQuote>
            </Stack.Item>
            <Stack.Divider />
            <Stack.Item>
              <span style={restrictionsstyle}>
                Restrictions:<br />
              </span>
              <BlockQuote>
                {forbid ? forbid : "None!"}
              </BlockQuote>
            </Stack.Item>
          </Stack>
        </Stack.Item>
      </Stack>
    </Section>
  );
};
